/***************************************************************************

    file                 : driver.cpp
    created              : 2006-08-31 01:21:49 UTC
    copyright            : (C) Daniel Schellhammer

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/


//#define DRIVER_PRINT_RACE_EVENTS
//#define DRIVER_DEBUG
//#define TIME_ANALYSIS // For Linux only

#include "driver.h"
#include "Utils.h"

#ifdef TARGET_TORCS
#include "tgfclient.h"
#endif

#ifdef TIME_ANALYSIS
#include <sys/time.h>
#endif

#define GRAVITY 9.81


TDriver::TDriver(int index)
{
  mCarIndex = index;

  oCar = NULL;

  mLOOKAHEAD_CONST = 4.0;         // [m]
  mOVT_FRONTSPACE = 20.0;         // [m]
  mOVT_FRONTMARGIN = 5.0;         // [m]

  // Variables
  mTrack = NULL;
  mPrevgear = 0;
  mAccel = 0.0;
  mTenthTimer = false;
  mStuck = false;
  mStuckcount = 0;
  mDrivingFastCount = 0;
  mOldTimer = 0.0;
  mAbsFactor = 0.5;
  mTclFactor = 0.5;
  mClutchtime = 0.0;
  mOldTargetToMiddle = 0.0;
  mPrevTargetdiff = 0.0;
  mOppInFrontspace = false;
  mPath[PATH_O].danpoint.radius = 1000.0;
  mCentifugal = 0.0;
  mSectSpeedfactor = 1.0;
  mLastDamage = 0;
  mCatchingOpp = false;
  mStateChange = false;
  mPathChange = false;
  mOppLeftHyst = false;
  mOppLeftOfMeHyst = false;
  mLeavePit = false;
  initVars();
  setPrevVars();
}


TDriver::~TDriver()
{
  delete mDanPath;
  delete mOpponents;
  delete mPit;
}


void TDriver::InitTrack(PTrack Track, PCarHandle CarHandle, PCarSettings *CarParmHandle, PSituation Situation)
{
  mTrack = Track;
  mTankvol = GfParmGetNum(CarHandle, SECT_CAR, PRM_TANK, (char*)NULL, 50);

  // Get file handles
  char* trackname = strrchr(Track->filename, '/') + 1;
  char buffer[256];

  // Discover the car type used
  *CarParmHandle = NULL;
  std::sprintf(buffer, "drivers/%s/%s.xml", MyBotName, MyBotName);
  *CarParmHandle = GfParmReadFile(buffer, GFPARM_RMODE_STD);
  std::sprintf(buffer, "%s/%s/%d", ROB_SECT_ROBOTS, ROB_LIST_INDEX, mCarIndex);
  mCarType = GfParmGetStr(*CarParmHandle, buffer, (char*)ROB_ATTR_CAR, "no good");

  // Parameters that are the same for all tracks
  *CarParmHandle = NULL;
  std::sprintf(buffer, "drivers/%s/%s/_all_tracks.xml", MyBotName, mCarType.c_str());
  *CarParmHandle = GfParmReadFile(buffer, GFPARM_RMODE_STD);
  if (*CarParmHandle == NULL) {
    mLearning = 0;
    mTestpitstop = 0;
    mTestLine = 0;
    mDriverMsgLevel = 0;
    mDriverMsgCarIndex = 0;
    mFRONTCOLL_MARGIN = 4.0;
  } else {
    mLearning = GfParmGetNum(*CarParmHandle, "private", "learning", (char*)NULL, 0.0);
    mTestpitstop = GfParmGetNum(*CarParmHandle, "private", "test pitstop", (char*)NULL, 0.0);
    mTestLine = (int)GfParmGetNum(*CarParmHandle, "private", "test line", (char*)NULL, 0.0);
    mDriverMsgLevel = (int)GfParmGetNum(*CarParmHandle, "private", "driver message", (char*)NULL, 0.0);
    mDriverMsgCarIndex = (int)GfParmGetNum(*CarParmHandle, "private", "driver message car index", (char*)NULL, 0.0);
    mFRONTCOLL_MARGIN = GfParmGetNum(*CarParmHandle, "private", "frontcollmargin", (char*)NULL, 4.0);
  }

  // Parameters that are track specific
  *CarParmHandle = NULL;
  switch (Situation->_raceType) {
    case RM_TYPE_QUALIF:
      std::sprintf(buffer, "drivers/%s/%s/qualifying/%s", MyBotName, mCarType.c_str(), trackname);
      *CarParmHandle = GfParmReadFile(buffer, GFPARM_RMODE_STD);
      break;
    default:
      break;
  }
  if (*CarParmHandle == NULL) {
    std::sprintf(buffer, "drivers/%s/%s/%s", MyBotName, mCarType.c_str(), trackname);
    *CarParmHandle = GfParmReadFile(buffer, GFPARM_RMODE_STD);
  }
  if (*CarParmHandle == NULL) {
    std::sprintf(buffer, "drivers/%s/%s/default.xml", MyBotName, mCarType.c_str());
    *CarParmHandle = GfParmReadFile(buffer, GFPARM_RMODE_STD);
  }
  mFuelPerMeter = GfParmGetNum(*CarParmHandle, "private", "fuelpermeter", (char*)NULL, 0.0008);
  
  // Set initial fuel
  double distance = Situation->_totLaps * mTrack->length;
  if (mTestpitstop) {
    distance = 1.9 * mTrack->length;
  }
  double fuel = getFuel(distance);
  mFuelStart = MIN(fuel, mTankvol);
  if (mLearning) {
    mFuelStart = mTankvol;
  }
  GfParmSetNum(*CarParmHandle, SECT_CAR, PRM_FUEL, (char*)NULL, mFuelStart);
}


void TDriver::NewRace(PtCarElt Car, PSituation Situation)
{
  oCar = Car;
  oSituation = Situation;
  initCa();
  initCw();
  readSpecs();
  readPrivateSection();
  printSetup();
  mDanPath = new DanPath(mTrack, mMAXLEFT, mMAXRIGHT, mCLOTHFACTOR);
  mOpponents = new Opponents(mTrack, Situation, Car);
  mPit = new Pit(mTrack, Situation, Car, mPITDAMAGE, mPITENTRYMARGIN);
  if (!readSectorSpeeds()) {
    mSect = mDanPath->mDanLine[0]->mDansect;
    saveFile();
  }
  mLearnSectTime = true;
  mLearnLap = true;
  mPrevRacePos= Car->_pos;
}


void TDriver::Drive()
{
#ifdef TIME_ANALYSIS
  struct timeval tv;
  gettimeofday(&tv, NULL); 
  double usec1 = tv.tv_usec;
#endif
  clearControls();
  updateTime();
  updateTimer();
  updateBasics();
  updateOpponents();
  updatePath();
  updateUtils();
  calcDrvState();
  calcTarget();
  calcMaxspeed();
  setControls();
  printChangedVars();
  setPrevVars();
#ifdef TIME_ANALYSIS
  gettimeofday(&tv, NULL); 
  double usec2 = tv.tv_usec;
  driverMsgValue(0, "useconds", usec2 - usec1);
#endif
}


int TDriver::PitCmd()                               // Handle pitstop
{
  mPit->pitCommand();
  return ROB_PIT_IM;  // Ready to be serviced
}


void TDriver::EndRace()                             // Stop race
{
  // This is never called by TORCS! Don't use it!
}


void TDriver::Shutdown()                            // Cleanup
{
}

void TDriver::clearControls()
{
  memset(&oCar->ctrl, 0, sizeof(tCarCtrl));
}


void TDriver::updateTime()
{
  oCurrSimTime = oSituation->currentTime;
}


void TDriver::updateTimer()
{
  double diff = oCurrSimTime - mOldTimer;
  if (diff >= 0.1) {
    mOldTimer += 0.1;
    mTenthTimer = true;
  } else {
    mTenthTimer = false;
  }
}


void TDriver::updateBasics()
{
  mPit->update();
  mMass = mCARMASS + mFUELWEIGHTFACTOR * oCar->_fuel;
  mSpeed = oCar->_speed_x;
  mFromStart = oCar->_distFromStartLine;
  mToMiddle = oCar->_trkPos.toMiddle;
  mOnLeftSide = mToMiddle > 0.0 ? true : false;
  mBorderdist = oCar->_trkPos.seg->width / 2.0 - fabs(mToMiddle) - oCar->_dimension_y / 2.0;
  mWalldist = oCar->_trkPos.seg->width / 2.0 - fabs(mToMiddle) - oCar->_dimension_y / 2.0;
  if (oCar->_trkPos.seg->side[mOnLeftSide] != NULL) {
    int style = oCar->_trkPos.seg->side[mOnLeftSide]->style;
    if (style < 2) {
      mWalldist += oCar->_trkPos.seg->side[mOnLeftSide]->width;
      if (oCar->_trkPos.seg->side[mOnLeftSide]->side[mOnLeftSide] != NULL) {
        mWalldist += oCar->_trkPos.seg->side[mOnLeftSide]->side[mOnLeftSide]->width;
      }
    }
  }
  mGlobalCarPos.x = oCar->_pos_X;
  mGlobalCarPos.y = oCar->_pos_Y;
  mAngleToTrack = RtTrackSideTgAngleL(&(oCar->_trkPos)) - oCar->_yaw;
  NORM_PI_PI(mAngleToTrack);
  mAngleToLeft = mAngleToTrack < 0.0 ? true : false;
  mPointingToWall = (mAngleToLeft == mOnLeftSide) ? true : false;
  mMu = oCar->_trkPos.seg->surface->kFriction;
  mFriction = mMu * (mMass * GRAVITY + mCA * mSpeed * mSpeed);
  mCentifugal = mMass * mSpeed * mSpeed / mPath[PATH_O].danpoint.radius;
  mBrakeFriction = sqrt(mFriction * mFriction - 0.2 * mCentifugal * mCentifugal);
  mBrakeforce = mBRAKEFORCEFACTOR * (mBrakeFriction / mBRAKEPRESS);
  mDamageDiff = oCar->_dammage - mLastDamage;
  mLastDamage = oCar->_dammage;
  mRacePosChange = mPrevRacePos - oCar->_pos;
  mPrevRacePos= oCar->_pos;
  
#ifdef DRIVER_PRINT_RACE_EVENTS
  if (mDamageDiff > 20 || (mDrvState == STATE_OFFTRACK && mStateChange == true) || mRacePosChange != 0) {
    char *str = GfTime2Str(oCurrSimTime, 0);
    GfOut("%s %s: Damage=%d Offtrack=%d RacePosChange=%d\n", str, oCar->_name, mDamageDiff, mDrvState == STATE_OFFTRACK, mRacePosChange);
    free(str);
  }
#endif

  updateDanSectorId();
  learnSpeedFactors();
  getSpeedFactors();
  updateStuck();
  updateAttackAngle();
  updateCurveAhead();
}


void TDriver::updateOpponents()
{
  mOpponents->update(oSituation, oCar);
  mOppNear = mOpponents->oppNear();
  mOppNear2 = mOpponents->oppNear2();
  mOppBack = mOpponents->oppBack();
  mOppLetPass = mOpponents->oppLetPass();
  mOpp = mOppNear;
  // Second Oppenent near?
  mBackmarkerInFrontOfTeammate = false;
  mTwoOppsAside = false;
  mOppComingFastBehind = mOpponents->oppComingFastBehind;

  if (mOppNear2 != NULL) {
    // Watch for backmarkers in front of teammate
    if (mOppNear2->backmarker && mOpp->teammate
    && mOpp->speed > 15.0
    && mOpp->mDist > 1.0
    && mOppNear2->mDist < 2.0 * mOVT_FRONTSPACE) {
      mBackmarkerInFrontOfTeammate = true;
    }
    // Check if 2. Opponent aside
    if (mOppNear2->mAside) {
      mTwoOppsAside = true;
    }
  }
  // Distances
  mOppDist = DBL_MAX;
  mOppSidedist = DBL_MAX;
  mOppAside = false;
  if (mOpp != NULL) {
    mOppDist = mOpp->mDist;
    if (mOpp->mAside && mOpp->borderdist > -1.0) {
      mOppSidedist = mOpp->sidedist;
      mOppAside = true;
    }
    mOppLeft = (mOpp->toMiddle > 0.0) ? true : false;
    mOppLeftHyst = hysteresis(mOppLeftHyst, mOpp->toMiddle, 0.5);
    mOppLeftOfMe = (mOpp->toMiddle - mToMiddle > 0.0) ? true : false;
    mOppLeftOfMeHyst = hysteresis(mOppLeftOfMeHyst, mOpp->toMiddle - mToMiddle, 0.3);
    mOppInFrontspace = (mOppDist < mOVT_FRONTSPACE && mOppDist >= 0.0) ? true : false;
  }
}


void TDriver::updatePath()
{
  for (int path = 0; path < 3; path++) {
    updatePathCar(path);
    updatePathTarget(path);
    updatePathOffset(path);
    updatePathSpeed(path);
  }
}


void TDriver::updateUtils()
{
  updateDrivingFast();
  updateCatchedRaceLine();
  updateFrontCollFactor();
  updateLetPass();
}


void TDriver::calcTarget()
{
  calcTargetToMiddle();
  calcGlobalTarget();
  calcTargetAngle();
}


void TDriver::setControls()
{
  oCar->_steerCmd = getSteer();
  oCar->_gearCmd = getGear();
  oCar->_clutchCmd = getClutch();  // must be after gear
  oCar->_brakeCmd = filterABS(getBrake(mMaxspeed));
  oCar->_accelCmd = mAccel = filterTCLSideSlip(filterTCL(getAccel(mMaxspeed)));  // must be after brake
}

void TDriver::printChangedVars()
{
  mStateChange = false;
  if (prev_mDrvState != mDrvState) {
    mStateChange = true;
  }
  mPathChange = false;
  if (prev_mDrvPath != mDrvPath || mStateChange) {
    mPathChange = true;
  }
  if (mDriverMsgLevel) {
    if (mStateChange) {
      driverMsgValue(1, "mDrvState:", mDrvState);
    }
    if (mPathChange) {
      driverMsgValue(1, "mDrvPath:", mDrvPath);
    }
    if (prev_mCurveAhead != mCurveAhead) {
      driverMsgValue(1, "mCurveAhead:", mCurveAhead);
    }
    if (prev_mDrivingFast != mDrivingFast) {
      driverMsgValue(1, "mDrivingFast:", mDrivingFast);
    }
    if (prev_mOvertake != mOvertake) {
      driverMsgValue(1, "mOvertake:", mOvertake);
    }
    if (prev_mLetPass != mLetPass) {
      driverMsgValue(1, "mLetPass:", mLetPass);
    }
    if (prev_mOppComingFastBehind != mOppComingFastBehind) {
      driverMsgValue(1, "mOppComingFastBehind:", mOppComingFastBehind);
    }
    if (prev_mCatchedRaceLine != mCatchedRaceLine) {
      driverMsgValue(1, "mCatchedRaceLine:", mCatchedRaceLine);
    }
    if (prev_mMaxSteerAngle != mMaxSteerAngle) {
      driverMsgValue(1, "mMaxSteerAngle:", mMaxSteerAngle);
    }
    if (prev_mBumpSpeed != mBumpSpeed) {
      driverMsgValue(1, "mBumpSpeed:", mBumpSpeed);
    }
    if (prev_mDanSectorId != mDanSectorId) {
      driverMsgValue(2, "mDanSectorId: ", mDanSectorId);
    }
    if (prev_mControlAttackAngle != mControlAttackAngle) {
      driverMsgValue(2, "mControlAttackAngle:", mControlAttackAngle);
    }
    if (prev_mControlYawRate != mControlYawRate) {
      driverMsgValue(3, "mControlYawRate:", mControlYawRate);
    }
    
    driverMsgValue(4, "mPathOffs:", mPathOffs);
    driverMsgValue(4, "vmax:", 3.6 * mMaxspeed);
  }
}

void TDriver::setPrevVars()
{
  prev_mDrvState = mDrvState;
  prev_mDrvPath = mDrvPath;
  prev_mDanSectorId = mDanSectorId;
  prev_mCurveAhead = mCurveAhead;
  prev_mDrivingFast = mDrivingFast;
  prev_mOvertake = mOvertake;
  prev_mLetPass = mLetPass;
  prev_mOppComingFastBehind = mOppComingFastBehind;
  prev_mCatchedRaceLine = mCatchedRaceLine;
  prev_mControlAttackAngle = mControlAttackAngle;
  prev_mControlYawRate = mControlYawRate;
  prev_mMaxSteerAngle = mMaxSteerAngle;
  prev_mBumpSpeed = mBumpSpeed;
}

void TDriver::initVars()
{
  mDrvState = STATE_RACE;
  mDrvPath = PATH_O;
  mDanSectorId = 0;
  mCurveAhead = false;
  mDrivingFast = false;
  mOvertake = false;
  mLetPass = false;
  mOppComingFastBehind = false;
  mCatchedRaceLine = false;
  mControlAttackAngle = false;
  mControlYawRate = false;
  mMaxSteerAngle = false;
  mBumpSpeed = false;
}

double TDriver::getPitSpeed()
{
  double speedEntryExit = mPit->getPitstop() ? mPITENTRYSPEED : mPITEXITSPEED;
  double pitlimitdist = fromStart(mPit->getLimitEntry() - mFromStart);
  double maxspeed = speedEntryExit;
  if (pitlimitdist < brakeDist1(mSpeed, mPit->getSpeedlimit())
  || mPit->isPitlimit(mFromStart)) {
    maxspeed = mPit->getSpeedlimit();
  }
  double brakespeed = 0.6 * brakeSpeed1(mPit->getDist(), 0.0);
  maxspeed = MIN(maxspeed, brakespeed);
  return maxspeed;
}


double TDriver::getMaxSpeed(DanPoint danpoint)
{
  double maxlookaheaddist = mBRAKEDISTFACTOR * brakeDist1(mSpeed, 0.0);
  double nextdist = 0.0;
  double nextradius;
  double nextspeed;
  double maxspeed = DBL_MAX;
  double lowest = DBL_MAX;
  double radius = fabs(danpoint.radius);;
  double curv_z = danpoint.curv_z;
  while (nextdist < maxlookaheaddist) {
    danpoint = mDanPath->nextPos(danpoint);
    nextdist = fromStart(danpoint.fromstart - mFromStart);
    nextradius = fabs(danpoint.radius);
    nextspeed = curveSpeed(nextradius);
    maxspeed = MIN(brakeSpeed(radius, mSpeed, nextdist, nextspeed), bumpSpeed(danpoint.curv_z));
    if (lowest > maxspeed) {
      lowest = maxspeed;
    }
  }
  maxspeed = MIN(1000, MIN(lowest, MIN(curveSpeed(radius), bumpSpeed(curv_z))));
  return maxspeed;
}


double TDriver::curveSpeed(double radius)
{
  radius = fabs(radius);
  return sqrt(mMu * GRAVITY * radius / (1.0 - MIN(0.99, radius * mCA * mMu / mMass)));
}


double TDriver::bumpSpeed(double curv_z)
{
  mBumpSpeed = false;
  double speed_z = DBL_MAX;
  if (curv_z < -0.02) {
    speed_z = mBUMPSPEEDFACTOR * sqrt(GRAVITY / -(curv_z)) / mSectSpeedfactor;
    mBumpSpeed = true;
  }
  return speed_z;
}


double TDriver::brakeSpeed(double radius, double speed, double nextdist, double nextspeed)
{
  double brakespeedlimit = DBL_MAX;
  double brakedistfactor = mBRAKEDISTFACTOR;
  if (!(mDrvState == STATE_RACE && mCatchedRaceLine) || mOppInFrontspace) {
    brakedistfactor *= 1.2;
  }
  double bdist = brakedistfactor * brakeDist(radius, speed, nextspeed);
  if (bdist > nextdist) {
    brakespeedlimit = nextspeed;
  }
  return brakespeedlimit;
}


double TDriver::brakeSpeed1(double nextdist, double nextspeed)
{
  return sqrt(nextspeed * nextspeed + nextdist * 2.0 * mMu * GRAVITY);
}


double TDriver::brakeDist(double radius, double speed, double allowedspeed)
{
  if (speed > allowedspeed) {
    double v1sqr = speed * speed;
    double v2sqr = allowedspeed * allowedspeed;
    double c = mMu * GRAVITY;
    double d = (mCA * mMu + mCW) / mMass;
    //double c = sqrt(mMu * GRAVITY * mMu * GRAVITY - (v1sqr / radius) * (v1sqr / radius));
    return (-log((c + v2sqr * d)/(c + v1sqr * d)) / (2.0 * d));
  }
  return -1000.0;
}


double TDriver::brakeDist1(double speed, double allowedspeed)
{
  if (speed > allowedspeed) {
    double allowedspeedsqr = allowedspeed * allowedspeed;
    return (mMass * (speed * speed - allowedspeedsqr) / 2.0) / (mMu * GRAVITY * mMass + allowedspeedsqr * (mCA * mMu + mCW));
  }
  return -1000.0;
}


double TDriver::getBrake(double maxspeed)
{
  double brakeforce = 0.0;
  
  if (mSpeed > maxspeed + 3.0) {
    brakeforce = mBrakeforce;
  } else if (mSpeed > maxspeed) {
    brakeforce = mBrakeforce / 4.0;
  }
  
  if (mDrvState == STATE_OFFTRACK) {
    brakeforce *= 0.2;
  }
  
  if (mDrvState == STATE_PITLANE) {
    // Pit speed limiter
    if (mSpeed > maxspeed) {
      brakeforce = mBrakeforce;
    } else if (mSpeed > maxspeed - 0.1) {
      brakeforce = 0.05;
    }
  }

  if (mDrvState == STATE_PITSTOP) {
    brakeforce = mBrakeforce;
  }
  
  double collbrakeforce = 0.0;
  if (onCollision()) {
    collbrakeforce = mBrakeforce + 0.1;
  }
  
  brakeforce = MAX(collbrakeforce, brakeforce);
  brakeforce = MIN(1.0, brakeforce);

  if (mDrvState == STATE_STUCK) {
    brakeforce = 0.0;
  }

  return brakeforce;
}


double TDriver::getAccel(double maxspeed)
{
  double accel;

  if (oCar->ctrl.brakeCmd > 0.0
  || fabs(mAttackAngle) > 0.3
  || (mMaxSteerAngle && mDrivingFast)) {
    accel = 0.0;
    mAccel = 0.5;
  } else {
    controlSpeed(mAccel, maxspeed);
    if (mLetPass) {
      mAccel *= 0.5;
    }
    accel = mAccel;
  }
  return accel;
}


double TDriver::getSteer()
{
  if (mDrvState == STATE_STUCK) {
    mTargetAngle = -mAngleToTrack;
  }
  limitSteerAngle(mTargetAngle);
  controlOffset(mTargetAngle);
  controlAttackAngle(mTargetAngle);
  controlYawRate(mTargetAngle);
  return mTargetAngle / oCar->_steerLock;
}


int TDriver::getGear()
{
  const double SHIFT_UP = 0.99;          // [-] (% of rpmredline)
  const double SHIFT_DOWN_MARGIN = 120.0;    // [rad/s] down from rpmredline
  if (mDrvState == STATE_STUCK) {
    return -1;
  }
  if (oCar->_gear <= 0) {
    return 1;
  }
  if (oCar->_enginerpm / oCar->_enginerpmRedLine > SHIFT_UP) {
    return oCar->_gear + 1;
  } else {
    double ratiodown = oCar->_gearRatio[oCar->_gear + oCar->_gearOffset - 1] / oCar->_gearRatio[oCar->_gear + oCar->_gearOffset];
    if (oCar->_gear > 1 && (oCar->_enginerpmRedLine - SHIFT_DOWN_MARGIN) / oCar->_enginerpm > ratiodown) {
      return oCar->_gear - 1;
    }
  }
  return oCar->_gear;
}


double TDriver::getClutch()
{
  if (oCar->_gear > 1 || mSpeed > 15.0) {
    if (oCar->_gear > mPrevgear) {
      mClutchtime = 0.6;
    }
    if (mClutchtime > 0.0) {
      mClutchtime -= 1.0 * RCM_MAX_DT_ROBOTS;
    }
    if (oCar->_gear < mPrevgear) {
      mClutchtime = 0.0;
    }
  } else if (oCar->_gear == 1) {
    // enginerpm are rad/sec
    if (oCar->_enginerpm > 700.0) {
      mClutchtime -= 0.01;
    } else {
      mClutchtime += 0.01;
    }
    if (fabs(mAngleToTrack) > 1.0 || mDrvState == STATE_OFFTRACK) {
      mClutchtime = 0.0;
    }
  } else if (oCar->_gear == -1) {
    // For the reverse gear.
    if (oCar->_enginerpm > 500.0) {
      mClutchtime -= 0.01;
    } else {
      mClutchtime += 0.01;
    }
  } else if (oCar->_gear == 0){
    // For a good start
    mClutchtime = 0.7;
  }
  mPrevgear = oCar->_gear;
  mClutchtime = MIN(MAX(0.0, mClutchtime), 1.0);
  return mClutchtime;
}


bool TDriver::stateStuck()
{
  if (mStuck) {
    return true;
  }
  return false;
}


bool TDriver::stateOfftrack()
{
  if (mDrvState != STATE_PITLANE && mDrvState != STATE_PITSTOP) {
    if (mBorderdist < -2.2 || (mSpeed < 15.0 && mBorderdist < -1.8)) {
      return true;
    }
  }
  return false;
}


bool TDriver::statePitstop()
{
  if (mDrvState == STATE_PITLANE && !mLeavePit) {
    float dl, dw;
    RtDistToPit(oCar, mTrack, &dl, &dw);
    if (fabs(dw) < 1.5 && dl > mTrack->length - 1.0) {
      return true;
    }
  } else if (mDrvState == STATE_PITSTOP) {
    // Traffic in the way when leaving?
    if (mOppBack != NULL) {
      if (mOppComingFastBehind && mOppBack->speed < 40.0) {
        return true;
      }
    }
    mLeavePit = true;
  } else if (mDrvState == STATE_RACE) {
    mLeavePit = false;
  }
  return false;
}


bool TDriver::statePitlane()
{
  if (mPit->getPitOffset(mFromStart)) {
    return true;
  }
  return false;
}


void TDriver::updateLetPass()
{
  
  if (mOppLetPass == NULL) {
    mLetPass = false;
    return;
  }
  // Check range
  if (!mLetPass) {
    if (mOppLetPass->mDist < -20.0 || mOppLetPass->mDist > 0.0) {
      return;
    }
  } else {
    if (mOppLetPass->mDist < -30.0 || mOppLetPass->mDist > 0.0) {
      mLetPass = false;
      return;
    }
  }
  // Check for other opponent between behind
  if (mOppBack != NULL) {
    if (mOppBack != mOppLetPass && mOppBack->mDist > mOppLetPass->mDist) {
      mLetPass = false;
      return;
    }
  }
  // Check for other opponent aside
  if (mOppNear != NULL) {
    if (mOppNear != mOppLetPass) {
      if (fabs(mOppNear->mDist) < 2.0) {
        mLetPass = false;
        return;
      }
    }
  }
  // Check for bad conditions
  if (!mLetPass) {
    if (mDrivingFast || mSpeed > mOppLetPass->speed + 1.0) {
      mLetPass = false;
      return;
    }
  }
  mLetPass = true;
}


void TDriver::setDrvState(int state)
{
  mDrvState = state;
}


double TDriver::pathOffs(int path)
{
  double offs = 0.0;
  if (mDrvState == STATE_RACE) {
    if (path == PATH_LR) {
      offs = (mPath[PATH_L].offset + mPath[PATH_R].offset) / 2.0;
    } else {
      offs = mPath[path].offset;
    }
  }
  return offs;
}


void TDriver::setDrvPath(int path)
{
  if (mDrvPath != path || mStateChange) {
    // Don't change when dangerous or speed on limits
    if ((mDrivingFast && !mOppAside) || mTwoOppsAside) {
      return;
    }
    // Don't change when opponent comes fast from behind
    if (mOppComingFastBehind) {
      return;
    }
    // Don't change when extreme fast in curve or to far away
    if (mSpeed > 80.0 && (mDrivingFast || fabs(pathOffs(path)) > 2.0)) {
      return;
    }
    // Choose first middle path if path offset too far
    if (fabs(pathOffs(path)) > fabs(mPath[PATH_L].offset - mPath[PATH_R].offset) / 2.0 + 1.0) {
      path = PATH_LR;
    }
    // Returning to track from excursion or pits
    if (mDrvState == STATE_OFFTRACK || mDrvState == STATE_PITLANE) {
      if (fabs(mPath[PATH_L].offset) < fabs(mPath[PATH_R].offset)) {
        path = PATH_L;
      } else {
        path = PATH_R;
      }
    }
    // Make the path change
    mDrvPath = path;
  }
  mPathOffs = pathOffs(mDrvPath);
}


void TDriver::calcDrvState()
{
  int path = PATH_O;
  if (stateStuck()) {
    setDrvState(STATE_STUCK);
  } else if (statePitstop()) {
    setDrvState(STATE_PITSTOP);
  } else if (statePitlane()) {
    setDrvState(STATE_PITLANE);
  } else if (stateOfftrack()) {
    setDrvState(STATE_OFFTRACK);
  } else {
    setDrvState(STATE_RACE);
    if (mTestLine == 1) {
      path = PATH_L;
    }
    if (mTestLine == 2) {
      path = PATH_R;
    }
    if (mTestLine == 3) {
      path = PATH_LR;
    }
    if (mLetPass) {
      if (mTargetToMiddle > 0.0) {
        path = PATH_L;
      } else {
        path = PATH_R;
      }
    }
    if (overtakeOpponent()) {
      path = overtakeStrategy();
    }
  }
  setDrvPath(path);
}


void TDriver::calcTargetToMiddle()
{
  switch (mDrvState) {
    case STATE_RACE: {
      // Normal lines
      if (mDrvPath == PATH_LR) {
        mTargetToMiddle = (mPath[PATH_L].target.toMiddle + mPath[PATH_R].target.toMiddle) / 2.0;
      } else {
        mTargetToMiddle = mPath[mDrvPath].target.toMiddle;
      }
      // Special cases
      if (mWalldist < mTARGETWALLDIST) {
        mTargetToMiddle = mTargetToMiddle - SIGN(mTargetToMiddle) * 1.0; //Needed for Corkscrew pit wall
      }
      if (mDrvPath == PATH_L || mDrvPath == PATH_R)  {
        if (mSpeed < 10.0)  {
          mTargetToMiddle = SIGN(mTargetToMiddle) * (mTrack->width / 2.0);
        }
      }
      if (fabs(mOppSidedist) < 3.5) {
        if (mBorderdist > 1.5) {
          mTargetToMiddle -= 5.0 * SIGN(mOppSidedist) * (3.5 - fabs(mOppSidedist));
        } else {
          mTargetToMiddle = SIGN(mTargetToMiddle) * ((mTrack->width / 2.0) - 1.5);
        }
      }
      if (oCurrSimTime < 3.0) {
        mTargetToMiddle = mToMiddle;
      }
      break;
    }
    case STATE_STUCK: {
      break;
    }
    case STATE_OFFTRACK: {
      mTargetToMiddle = SIGN(mToMiddle) * ((mTrack->width / 2.0) - 1.0);
      break;
    }
    case STATE_PITLANE: {
      mTargetToMiddle = mPit->getPitOffset(mTargetFromstart);
      if (fabs(mTargetToMiddle) < mTrack->width / 2.0) {
        double pitentrydist = fromStart(mPit->getPitEntry() - mFromStart);
        if (pitentrydist > 0.0 && pitentrydist < mPITENTRYMARGIN) {
          mTargetToMiddle = mToMiddle + (mTargetToMiddle - mToMiddle) * (mPITENTRYMARGIN - pitentrydist) / mPITENTRYMARGIN;
        }
      }
      break;
    }
  }
}


bool TDriver::overtakeOpponent()
{
  mOvertake = false;
  if (mOpp == NULL) {
    return mOvertake;
  }
  if (mOpp->borderdist > -1.0) {
    if (mOpp->mCatchtime < 3.0) mCatchingOpp = true;
    if (mOpp->mCatchtime > 100.0) mCatchingOpp = false;
    double maxdist = MIN(50, 5.0 + mSpeed);
    if (mOppDist < maxdist && mOppDist > 3.0 && !mDrivingFast) {
      if (((mCatchingOpp || mOppDist < 10.0) && !mCurveAhead && !mOpp->teammate)
      || mSpeed < 15.0
      || (mOpp->backmarker && mOppDist < 15.0)) {
        mOvertake = true;
      }
    }
    // if aside always overtake
    if (mOppDist > -2.0 && mOppDist <= 3.0) {
      mOvertake = true;
    }
    // Special case: if in front and on raceline stay there
    if ((mOppDist < 0.0 && mDrvPath == PATH_O && mCatchedRaceLine)) {
      mOvertake = false;
    }
  }
  return mOvertake;

}


int TDriver::overtakeStrategy()
{
  int path = mDrvPath;
  // Normal overtaking
  if (mOpp->mDist > 4.0) {
    // Generally drive on the side with more space
    if (fabs(mPath[PATH_R].local.toMiddle - mOpp->toMiddle) - fabs(mPath[PATH_L].local.toMiddle - mOpp->toMiddle) > 0.0) {
      path = PATH_R;
    } else {
      path = PATH_L;
    }
    // But stay on your side when there is enough space
    if (mOppLeftOfMeHyst) {
      if (fabs(mPath[PATH_R].local.toMiddle - mOpp->toMiddle) > 4.0) {
        path = PATH_R;
      }
    } else {
      if (fabs(mPath[PATH_L].local.toMiddle - mOpp->toMiddle) > 4.0) {
        path = PATH_L;
      }
    }
    // backmarkers
    if (mOpp->backmarker) {
      if (mOppLeftHyst) {
        path = PATH_R;
      } else {
        path = PATH_L;
      }
    } 
  } else {
    // Always stay on your side if opponent aside
    if (mOppLeftOfMe) {
      path = PATH_R;
    } else {
      path = PATH_L;
    }
  }
  return path;
}


void TDriver::updateStuck()
{
  if (mTenthTimer) {
    if (mWait || mDrvState == STATE_PITSTOP) {
      mStuckcount = 0;
    }
    if (mStuck) {
      if (fabs(mSpeed) < 7.0) {
        if (mStuckcount++ > 40) {
          mStuckcount = 0;
          mStuck = false;
        }
      } else {
        mStuckcount = 0;
        mStuck = false;
      }
    } else if (fabs(mSpeed) < 1.5) {
      if (mStuckcount++ > 40) {
        mStuckcount = 0;
        mStuck = true;
      }
    } else {
      mStuckcount = 0;
    }
  }
}


bool TDriver::onCollision()
{
  mWait = false;
  mColl = false;
  // check opponents
  for (int i = 0; i < mOpponents->nopponents; i++) {
    Opponent* opp = &mOpponents->opponent[i];
    if (opp->mDist > -5.0 && opp->mDist < 150.0) {
      if (opp->mInDrivingDirection) {
        if (oppInCollisionZone(opp)) {
          double brakedist = brakeDistToOpp(opp);
          if (brakedist > (opp->mDist - mFrontCollFactor * mFRONTCOLL_MARGIN)
          || (mSpeed < -0.1 && opp->mDistFromCenter < 5.0)) {
            return mColl = true;
          }
        }
      }
    }
  }
  // is track free to enter
  if (mOppComingFastBehind
  && mBorderdist < -2.0 && mBorderdist > -5.0
  && mSpeed < 15.0
  && !(mPointingToWall && oCar->_gear >= 0)) {
    mWait = true;
    mColl = true;
  }
  // check for wall
  if (mPointingToWall && fabs(mAngleToTrack) > 0.7) {
    if (mWalldist - 1.0 < brakeDist1(mSpeed, 0.0) && !mStuck) {
      mColl = true;
    }
  }
  return mColl;
}


double TDriver::brakeDistToOpp(Opponent* opp)
{
  double brakedist = brakeDist1(mSpeed, opp->speed);
  if (opp->mDist > 30.0 && opp->speed < mSpeed) {
    brakedist -= brakedist * opp->speed / mSpeed;
  }  
  return brakedist;
}


bool TDriver::oppInCollisionZone(Opponent* opp)
{
  double diffspeedmargin = diffSpeedMargin(opp);
  if (opp->mDistToStraight < diffspeedmargin || oppOnMyLine(opp)) {
    return true;
  }
  return false;
}


bool TDriver::oppOnMyLine(Opponent* opp)
{
  int path = mDrvPath;
  if (path == PATH_LR || mDrvState != STATE_RACE) {
    return false;
  }
  double oppfs = opp->fromStart;
  DanPoint oppdp;
  mDanPath->getDanPos(path, oppfs, oppdp);
  if (fabs(oppdp.tomiddle - opp->toMiddle) < 2.5) {
    return true;
  }
  return false;
}


double TDriver::diffSpeedMargin(Opponent* opp)
{
  double speeddiff = MAX(0.0, mSpeed - opp->speed);
  double oppangle = opp->mAngle;
  double angle = 0.0;
  if ((oppangle < 0.0 && mOppLeftOfMe) || (oppangle > 0.0 && !mOppLeftOfMe)) {
    angle = MIN(0.3, fabs(oppangle));
  }
  double factor = MAX(0.1, 1.0 * angle);
  double diffspeedmargin = MIN(15.0, MAX(3.0, 2.0 + 2 * sin(fabs(oppangle)) + factor * speeddiff));
  if (mSpeed < 5.0 || oppNoDanger(opp)) {
    diffspeedmargin = 2.0;
  }
  if (mDrivingFast) {
    diffspeedmargin += 1.0;
  }
  return diffspeedmargin;
}


bool TDriver::oppNoDanger(Opponent* opp)
{
  if ((opp->borderdist < -1.0 && fabs(opp->speed) < 0.5 && mBorderdist > 0.0 && fabs(opp->mDist) > 1.0)) {
    return true;
  }
  return false;
}


void TDriver::initCa()
{
  char* WheelSect[4] = {(char*)SECT_FRNTRGTWHEEL, (char*)SECT_FRNTLFTWHEEL, (char*)SECT_REARRGTWHEEL, (char*)SECT_REARLFTWHEEL};
  mFRONTWINGANGLE = GfParmGetNum(oCar->_carHandle, SECT_FRNTWING, PRM_WINGANGLE, (char*)NULL, 0.0);
  mREARWINGANGLE = GfParmGetNum(oCar->_carHandle, SECT_REARWING, PRM_WINGANGLE, (char*)NULL, 0.0);
  double frontwingarea = GfParmGetNum(oCar->_carHandle, SECT_FRNTWING, PRM_WINGAREA, (char*)NULL, 0.0);
  double rearwingarea = GfParmGetNum(oCar->_carHandle, SECT_REARWING, PRM_WINGAREA, (char*)NULL, 0.0);
  double frontclift = GfParmGetNum(oCar->_carHandle, SECT_AERODYNAMICS, PRM_FCL, (char*)NULL, 0.0);
  double rearclift = GfParmGetNum(oCar->_carHandle, SECT_AERODYNAMICS, PRM_RCL, (char*) NULL, 0.0);
  double frntwingca = 1.23 * frontwingarea * sin(mFRONTWINGANGLE);
  double rearwingca = 1.23 * rearwingarea * sin(mREARWINGANGLE);
  double cl = frontclift + rearclift;
  double h = 0.0;
  for (int i = 0; i < 4; i++) {
    h += GfParmGetNum(oCar->_carHandle, WheelSect[i], PRM_RIDEHEIGHT, (char*) NULL, 0.20f);
  }
  h*= 1.5; h = h * h; h = h * h; h = 2.0 * exp(-3.0 * h);
  mCA = h * cl + 4.0 * (frntwingca+rearwingca);
}


void TDriver::initCw()
{
  double cx = GfParmGetNum(oCar->_carHandle, SECT_AERODYNAMICS, PRM_CX, (char*) NULL, 0.0f);
  double frontarea = GfParmGetNum(oCar->_carHandle, SECT_AERODYNAMICS, PRM_FRNTAREA, (char*) NULL, 0.0f);
  mCW = 0.645f * cx * frontarea;
}


void TDriver::readSpecs()
{
  mWHEELBASE = GfParmGetNum(oCar->_carHandle, SECT_FRNTAXLE, PRM_XPOS, (char*)NULL, 0.0) - GfParmGetNum(oCar->_carHandle, SECT_REARAXLE, PRM_XPOS, (char*)NULL, 0.0);
  mCARMASS = GfParmGetNum(oCar->_carHandle, SECT_CAR, PRM_MASS, NULL, 1000.0);
  mBRAKEPRESS = GfParmGetNum(oCar->_carHandle, SECT_BRKSYST, PRM_BRKPRESS, NULL, 20000000.0) / 1000.0;
}


void TDriver::readPrivateSection()
{
  mBRAKEDISTFACTOR = GfParmGetNum(oCar->_carHandle, "private", "brakedistfactor", (char*)NULL, 1.0);
  mBRAKEFORCEFACTOR = GfParmGetNum(oCar->_carHandle, "private", "brakeforcefactor", (char*)NULL, 1.0);
  mBUMPSPEEDFACTOR = GfParmGetNum(oCar->_carHandle, "private", "bumpspeedfactor", (char*)NULL, 3.0);
  mFUELWEIGHTFACTOR = GfParmGetNum(oCar->_carHandle, "private", "fuelweightfactor", (char*)NULL, 1.0);
  mPITDAMAGE = (int)GfParmGetNum(oCar->_carHandle, "private", "pitdamage", (char*)NULL, 5000);
  mPITENTRYMARGIN = GfParmGetNum(oCar->_carHandle, "private", "pitentrymargin", (char*)NULL, 0.0);
  mPITENTRYSPEED = GfParmGetNum(oCar->_carHandle, "private", "pitentryspeed", (char*)NULL, 25.0);
  mPITEXITSPEED = GfParmGetNum(oCar->_carHandle, "private", "pitexitspeed", (char*)NULL, 25.0);
  mSPEEDFACTOR = GfParmGetNum(oCar->_carHandle, "private", "speedfactor", (char*)NULL, 1.0);
  mTARGETFACTOR = GfParmGetNum(oCar->_carHandle, "private", "targetfactor", (char*)NULL, 0.3);
  mTARGETWALLDIST = GfParmGetNum(oCar->_carHandle, "private", "targetwalldist", (char*)NULL, 0.0);
  mTRACTIONCONTROL = GfParmGetNum(oCar->_carHandle, "private", "tractioncontrol", (char*)NULL, 0.0);
  mMAXLEFT = GfParmGetNum(oCar->_carHandle, "private", "maxleft", (char*)NULL, 10.0);
  mMAXRIGHT = GfParmGetNum(oCar->_carHandle, "private", "maxright", (char*)NULL, 10.0);
  mCLOTHFACTOR = GfParmGetNum(oCar->_carHandle, "private", "clothoidfactor", (char*)NULL, 1.005);
}


void TDriver::printSetup()
{
  //if (mDriverMsgLevel && mCarIndex == mDriverMsgCarIndex) {
    GfOut("%s: Learning=%d\n", oCar->_name, mLearning);
    GfOut("%s: Testpitstop=%d\n", oCar->_name, mTestpitstop);
    GfOut("%s: TestLine=%d\n", oCar->_name, mTestLine);
    GfOut("%s: DriverMsgLevel=%d\n", oCar->_name, mDriverMsgLevel);
    GfOut("%s: DriverMsgCarIndex=%d\n", oCar->_name, mDriverMsgCarIndex);
    GfOut("%s: FRONTCOLL_MARGIN=%g\n", oCar->_name, mFRONTCOLL_MARGIN);
  
    GfOut("%s: FRONTWINGANGLE=%g\n", oCar->_name, mFRONTWINGANGLE * 360 / (2 * PI));
    GfOut("%s: REARWINGANGLE=%g\n", oCar->_name, mREARWINGANGLE * 360 / (2 * PI));
    GfOut("%s: CA=%g\n", oCar->_name, mCA);
    GfOut("%s: WHEELBASE=%g\n", oCar->_name, mWHEELBASE);
    GfOut("%s: CARMASS=%g\n", oCar->_name, mCARMASS);
    GfOut("%s: BRAKEPRESS=%g\n", oCar->_name, mBRAKEPRESS);

    GfOut("%s: brakedistfactor=%g\n", oCar->_name, mBRAKEDISTFACTOR);
    GfOut("%s: brakeforcefactor=%g\n", oCar->_name, mBRAKEFORCEFACTOR);
    GfOut("%s: bumpspeedfactor=%g\n", oCar->_name, mBUMPSPEEDFACTOR);
    GfOut("%s: fuelpermeter=%g\n", oCar->_name, mFuelPerMeter);
    GfOut("%s: fuelweightfactor=%g\n", oCar->_name, mFUELWEIGHTFACTOR);
    GfOut("%s: pitdamage=%d\n", oCar->_name, mPITDAMAGE);
    GfOut("%s: pitentrymargin=%g\n", oCar->_name, mPITENTRYMARGIN);
    GfOut("%s: pitentryspeed=%g\n", oCar->_name, mPITENTRYSPEED);
    GfOut("%s: pitexitspeed=%g\n", oCar->_name, mPITEXITSPEED);
    GfOut("%s: speedfactor=%g\n", oCar->_name, mSPEEDFACTOR);
    GfOut("%s: targetfactor=%g\n", oCar->_name, mTARGETFACTOR);
    GfOut("%s: targetwalldist=%g\n", oCar->_name, mTARGETWALLDIST);
    GfOut("%s: tractioncontrol=%d\n", oCar->_name, mTRACTIONCONTROL);

    GfOut("%s: maxleft=%g\n", oCar->_name, mMAXLEFT);
    GfOut("%s: maxright=%g\n", oCar->_name, mMAXRIGHT);
    GfOut("%s: clothoidfactor=%g\n", oCar->_name, mCLOTHFACTOR);
  //}
}


double TDriver::filterABS(double brake)
{
  double ABS_MINSPEED = 3.0;      // [m/s]
  double ABS_SLIP = 0.9;
  double slip = 0.0;

  if (mSpeed < ABS_MINSPEED) return brake;

  int i;
  for (i = 0; i < 4; i++) {
    slip += oCar->_wheelSpinVel(i) * oCar->_wheelRadius(i) / mSpeed;
  }
  slip = slip / 4.0;
  if (slip < ABS_SLIP) {
    if (mAbsFactor > 0.4) mAbsFactor -= 0.1;
    brake *= mAbsFactor;
  } else {
    if (mAbsFactor < 0.9) mAbsFactor += 0.1;
    brake *= mAbsFactor;
  }
  return brake;
}


double TDriver::filterTCL(double accel)
{
  if (!mTRACTIONCONTROL && mDrvPath == PATH_O) {
    return accel;
  }
  const double TCL_SLIP = 2.0;
  double slip = filterTCL_RWD() - mSpeed;
  if (slip > TCL_SLIP) {
    if (mTclFactor > 0.1) mTclFactor -= 0.1;
    accel *= mTclFactor;
  } else {
    if (mTclFactor < 0.9) mTclFactor += 0.1;
  }
  return accel;
}


double TDriver::filterTCL_RWD()
{
  return (oCar->_wheelSpinVel(REAR_RGT) + oCar->_wheelSpinVel(REAR_LFT)) *
      oCar->_wheelRadius(REAR_LFT) / 2.0f;
}


double TDriver::filterTCLSideSlip(double accel)
{
  if (!mTRACTIONCONTROL && mDrvPath == PATH_O) {
    return accel;
  }
  double sideslip = (oCar->_wheelSlipSide(FRNT_RGT) + oCar->_wheelSlipSide(FRNT_LFT) + oCar->_wheelSlipSide(REAR_RGT) + oCar->_wheelSlipSide(REAR_LFT)) / 4.0f;
  if (sideslip > 2.0) {
    return accel *= 0.9;
  }
  return accel;
}


double TDriver::fromStart(double fromstart)
{
  if (fromstart > mTrack->length) {
    return fromstart - mTrack->length;
  } else if (fromstart < 0.0) {
    return fromstart + mTrack->length;
  }
  return fromstart;
}


void TDriver::updateDanSectorId()
{
  for (int i = 0; i < (int)mSect.size(); i++) {
    if (mFromStart > mSect[i].fromstart
    && mFromStart < mSect[i].fromstart + 3.0) {
      mDanSectorId = i;
    }
  }
}


void TDriver::learnSpeedFactors()
{
  if (!(oSituation->_raceType == RM_TYPE_PRACTICE && mLearning)) {
    return;
  }

  int nrOfSectors = (int)mSect.size();

  if (oCar->_laps >= 2 && mLearnLap) {

    // Get offtrack sector
    bool offtrack = mBorderdist < -1.6;
    if (offtrack) {
      if (mFromStart > mSect[mDanSectorId].fromstart
      && mFromStart < mSect[mDanSectorId].fromstart + 10.0) {
        int prevsect = (mDanSectorId > 0) ? mDanSectorId-1 : nrOfSectors-1;
        mOfftracksector.push_back(prevsect);
        driverMsgValue(0, "offtrack prev", mBorderdist + 1.6);
      } else {
        mOfftracksector.push_back(mDanSectorId);
        driverMsgValue(0, "offtrack", mBorderdist + 1.6);
      }
    }
    
    // Get barrier collisions
    if (mDamageDiff > 3 && mBorderdist < -0.5) {
      mOfftracksector.push_back(mDanSectorId);
      driverMsgValue(0, "coll damage?", mDamageDiff);
    }

    // Get sector times
    for (int i = 0; i < nrOfSectors; i++) {
      if (mFromStart > mSect[i].fromstart
      && mFromStart < mSect[i].fromstart + 3.0) {
        if (mLearnSectTime) {
          mLearnSectTime = false;
          int prev_i = (i > 0) ? i-1 : nrOfSectors-1;
          mSect[prev_i].time = oCurrSimTime - mSectorTime;
          for (int j = 0; j < (int)mOfftracksector.size(); j++) {
            mSect[mOfftracksector[j]].time = 10000;
            driverMsgValue(0, "offtracksector", mOfftracksector[j]);
          }
          mSectorTime = oCurrSimTime;
          driverMsgValue(0, "sector: ", i);
        }
      } else if (mFromStart > mSect[i].fromstart + 3.0
      && mFromStart < mSect[i].fromstart + 6.0) {
        mLearnSectTime = true;
	mOfftracksector.clear();
      }
    }
  }

  // Update speed factors
  if (mFromStart > 3.0 && mFromStart < 6.0 && oCar->_laps >= 3 && mLearnLap) {
    mLearnLap = false;
    double bestlap = 0.0;
    double lastlap = 0.0;
    for (int i = 0; i < nrOfSectors; i++) {
      bestlap += mSect[i].besttime;
      lastlap += mSect[i].time;
    }
    for (int i = 0; i < nrOfSectors; i++) {
      GfOut("S:%d l:%d fs:%g t:%g bt:%g sf:%g bsf:%g\n", i, mSect[i].learned, mSect[i].fromstart, mSect[i].time, mSect[i].besttime, mSect[i].speedfactor, mSect[i].bestspeedfactor);
      double delta = 0.04;
      if (mSect[i].speedfactor >= 1.4) {
        delta = 0.04;
      }

      int prev_i = (i > 0) ? i-1 : nrOfSectors-1;
      int next_i = (i < nrOfSectors-1) ? i+1 : 0;

      if (mSect[i].learned && mSect[i].time == 10000) {
        mSect[i].speedfactor -= delta;
        mSect[i].bestspeedfactor = mSect[i].speedfactor;
        driverMsgValue(0, "reduced:", i);
      }

      if (!mSect[i].learned) {

        if (mSect[i].time == 10000) {
          if (!mSect[prev_i].learned) {
            mSect[prev_i].speedfactor -= delta;
            mSect[prev_i].bestspeedfactor = mSect[prev_i].speedfactor;
          }
        }

        if (mSect[i].time < mSect[i].besttime && mSect[i].bestspeedfactor < 1.8) {
          mSect[i].bestspeedfactor = mSect[i].speedfactor;
          mSect[i].besttime = mSect[i].time;
        } else if (mSect[i].time >= mSect[i].besttime && mSect[i].time < mSect[i].besttime + 0.03 && mSect[i].bestspeedfactor < 1.8) {
          mSect[i].bestspeedfactor = mSect[i].speedfactor;
        } else {
          mSect[i].speedfactor = mSect[i].bestspeedfactor;
          mSect[i].learned = 1;
          driverMsgValue(0, "learned:", i);
        }

        if (mSect[next_i].learned && mSect[next_i].time > mSect[next_i].besttime + 0.05) {
          mSect[i].speedfactor = mSect[i].bestspeedfactor;
          mSect[i].learned = 1;
          driverMsgValue(0, "learned:", i);
        }
        if (mSect[next_i].learned && mSect[next_i].time == 10000) {
          mSect[i].speedfactor -= delta;
          mSect[i].bestspeedfactor = mSect[i].speedfactor;
          mSect[i].learned = 1;
          driverMsgValue(0, "learned:", i);
	}
      }

      if (!mSect[i].learned) {
        mSect[i].speedfactor += delta;
      }
    }
    GfOut("lap: %d time total: %g best: %g\n", oCar->_laps-1, lastlap, bestlap);
    saveFile();
  }
  if (mFromStart > 6.0 && mFromStart < 9.0) {
    mLearnLap = true;
  }
  // Stop learning for the last lap
  if (mFromStart > 6.0 && oCar->_laps == oSituation->_totLaps) {
    mLearnLap = false;
  }
}


void TDriver::getSpeedFactors()
{
  for (int i = 0; i < (int)mSect.size(); i++) {
    if (mFromStart > mSect[i].fromstart && mFromStart < mSect[i].fromstart + 3.0) {
      mSectSpeedfactor = mSPEEDFACTOR * mSect[i].speedfactor;
    }
  }
}


void TDriver::updatePathCar(int path)
{
  if (!mDanPath->getDanPos(path, mFromStart, mPath[path].danpoint)) {
#ifdef DRIVER_DEBUG
    exit(1);
#endif
  }
  if (!mDanPath->getLocalPos(oCar->_trkPos.seg, mPath[path].danpoint, &mPath[path].local)) {
    driverMsg("TDriver::updatePathCar");
#ifdef DRIVER_DEBUG
    exit(1);
#endif
  }
}


void TDriver::updatePathTarget(int path)
{
  if (mDrvState == STATE_RACE && path == PATH_O && mCatchedRaceLine) {
    mTargetFromstart = fromStart(mFromStart + mLOOKAHEAD_CONST + mTARGETFACTOR * mSpeed);
  } else if (mDrvState == STATE_PITLANE) {
    mTargetFromstart = fromStart(mFromStart + 2.0 + 0.3 * mSpeed);
  } else {
    mTargetFromstart = fromStart(mFromStart + mLOOKAHEAD_CONST + 0.3 * mSpeed);
  }
  DanPoint target;
  if (!mDanPath->getDanPos(path, mTargetFromstart, target)) {
#ifdef DRIVER_DEBUG
    exit(1);
#endif
  }
  if (!mDanPath->getLocalPos(oCar->_trkPos.seg, target, &mPath[path].target)) {
    driverMsg("TDriver::updatePathTarget");
#ifdef DRIVER_DEBUG
    exit(1);
#endif
  }
}


void TDriver::updatePathOffset(int path)
{
  mPath[path].offset = mPath[path].local.toMiddle - mToMiddle;
}


void TDriver::updatePathSpeed(int path)
{
  mPath[path].maxspeed = mSectSpeedfactor * getMaxSpeed(mPath[path].danpoint);
}


void TDriver::updateCurveAhead()
{
  double fs = fromStart(mFromStart + 200);
  DanPoint dp;
  mDanPath->getDanPos(0, fs, dp);
  if (dp.type != TR_STR && fabs(dp.radius) < 150.0 && mSpeed > 30.0) {
    mCurveAheadFromStart = fs;
    mCurveAhead = true;
  }
  if (mCurveAhead && (mFromStart > mCurveAheadFromStart || mSpeed < 30.0)) {
    mCurveAhead = false;
  }
}


void TDriver::updateDrivingFast()
{
  double maxspeed = mPath[PATH_O].maxspeed;
  mDrivingFast = mSpeed > 0.5 * maxspeed;
  // Delay state change
  if (prev_mDrivingFast && !mDrivingFast) {
    if (mDrivingFastCount < 20) {
      mDrivingFastCount++;
      mDrivingFast = true;
    } else {
      mDrivingFastCount = 0;
      mDrivingFast = false;
    }
  }
}


void TDriver::updateCatchedRaceLine()
{
  if (mDrvState == STATE_RACE && mDrvPath < PATH_LR && !mPathChange) {
    if (fabs(mPath[mDrvPath].offset) < 1.5) {
      if (mCatchedRaceLineTime > 3.0) {
        mCatchedRaceLine = true;
      } else if (mTenthTimer) {
        mCatchedRaceLineTime += 0.1;
      }
    } else if (!mCatchedRaceLine) {
      mCatchedRaceLineTime = 0.0;
    } else if (fabs(mPath[mDrvPath].offset) > 4.5) {
      mCatchedRaceLine = false;
      mCatchedRaceLineTime = 0.0;
    }
  } else {
    mCatchedRaceLine = false;
    mCatchedRaceLineTime = 0.0;
  }
}


void TDriver::updateFrontCollFactor()
{
  mFrontCollFactor = 1.0;
  if (mBackmarkerInFrontOfTeammate || mDrivingFast) {
    mFrontCollFactor = 1.2;
  }
  if (mSpeed < 5.0) {
    mFrontCollFactor = 0.2;
  }
}


void TDriver::calcMaxspeed()
{
  // Calc slowspeed
  double slowspeed;
  if (mToMiddle > 0.0) {
    slowspeed = mPath[PATH_L].maxspeed;
  } else {
    slowspeed = mPath[PATH_R].maxspeed;
  }
  if (!mCatchedRaceLine && mMaxSteerAngle) {
    slowspeed = 0.8 * slowspeed;
  }
  // Set speed
  switch (mDrvState) {
    case STATE_RACE: {
      double maxspeed;
      if (mDrvPath == PATH_LR) {
        maxspeed = MIN(mPath[PATH_L].maxspeed, mPath[PATH_R].maxspeed);
      } else if (mDrvPath == PATH_O) {
        maxspeed = mPath[mDrvPath].maxspeed;
      } else if (!mCatchedRaceLine && mMaxSteerAngle) {
        maxspeed = 0.9 * mPath[mDrvPath].maxspeed;
      } else {
        maxspeed = 0.95 * mPath[mDrvPath].maxspeed;
      }
      mMaxspeed = MAX((1.0 - fabs(mPathOffs) / 5.0)  * maxspeed, slowspeed);
      if (mDrvPath < PATH_LR && mCatchedRaceLine) {
        mMaxspeed = maxspeed;
      }
      // Special cases
      if (mOppDist >= 0.0 && mOppDist < 30.0) {
        mMaxspeed *= 0.98;
      }
      if (mLetPass) {
        mMaxspeed = slowspeed;
      }
      if (fabs(mAngleToTrack) > 1.0) {
        mMaxspeed = 10.0;
      }
      break;
    }
    case STATE_STUCK: {
      mMaxspeed = 7.0;
      break;
    }
    case STATE_OFFTRACK: {
      mMaxspeed = 7.0;
      break;
    }
    case STATE_PITLANE: {
      mMaxspeed = MIN(getPitSpeed(), 0.7 * slowspeed);
      break;
    }
    default: {
      break;
    }
  }
}


void TDriver::limitSteerAngle(double& targetangle)
{
  double v2 = mSpeed * mSpeed;
  double rmax = v2 / (mMu * (GRAVITY + v2 * mCA / mMass));
  double maxangle = atan(mWHEELBASE / rmax);
  double maxanglefactor;
  if (mDrvState == STATE_OFFTRACK) {
    maxanglefactor = 1.0;
  } else if (mCatchedRaceLine) {
    maxanglefactor = 9.0;
  } else if (mDrivingFast) {
    maxanglefactor = 6.0;
  } else {
    maxanglefactor = 3.0;
 }
  maxangle *= maxanglefactor;
  mMaxSteerAngle = false;
  if (fabs(targetangle) > maxangle) {
    targetangle = SIGN(targetangle) * maxangle;
    NORM_PI_PI(targetangle);
    mMaxSteerAngle = true;
  }
}


void TDriver::calcGlobalTarget()
{
  mPath[PATH_O].target.toMiddle = mTargetToMiddle;
  tdble x, y;
  RtTrackLocal2Global(&mPath[PATH_O].target, &x, &y, TR_TOMIDDLE);
  mGlobalTarget.x = x;
  mGlobalTarget.y = y;
}


void TDriver::calcTargetAngle()
{
  mTargetAngle = Utils::VecAngle(mGlobalTarget - mGlobalCarPos) - oCar->_yaw;
  NORM_PI_PI(mTargetAngle);
}


void TDriver::controlSpeed(double& accelerator, double maxspeed)
{
  // Set parameters
  mSpeedController.m_p = 0.02;
  mSpeedController.m_d = 0.0;
  // Run controller
  double speeddiff =  maxspeed - mSpeed;
  accelerator += mSpeedController.sample(speeddiff);
  if (accelerator > 1.0) {
    accelerator = 1.0;
  }
}


void TDriver::updateAttackAngle()
{
  double velAng = atan2(oCar->_speed_Y, oCar->_speed_X);
  mAttackAngle = velAng - oCar->_yaw;
  NORM_PI_PI(mAttackAngle);
  if (mSpeed < 1.0) {
    mAttackAngle = 0.0;
  }
}


void TDriver::controlAttackAngle(double& targetangle)
{
  if (fabs(mAttackAngle) > 0.15
  || mDrvState == STATE_OFFTRACK) {
    mAttackAngleController.m_d = 4.0;
    mAttackAngleController.m_p = 0.4;
    targetangle += mAttackAngleController.sample(mAttackAngle);
    NORM_PI_PI(targetangle);
    mControlAttackAngle = true;
  } else {
    mAttackAngleController.sample(mAttackAngle);
    mControlAttackAngle = false;
  }
}


void TDriver::controlOffset(double& targetangle)
{
  // Set parameters
  if (mCatchedRaceLine && mDrvPath == PATH_O) {
    mOffsetController.m_p = 0.06;
    mOffsetController.m_d = 1.0;
  } else {
    mOffsetController.m_p = 0.01;
    mOffsetController.m_d = 0.6;
  }

  // Run controller
  if (mCatchedRaceLine) {
    targetangle += mOffsetController.sample(mPathOffs);
    NORM_PI_PI(targetangle);
  } else {
    mOffsetController.sample(mPathOffs, 0.0);
  }
}


void TDriver::controlYawRate(double& targetangle)
{
  mControlYawRate = false;
  if (mDrvState == STATE_RACE && mDrvPath < PATH_LR) {
    double AvgK = 1 / mPath[mDrvPath].danpoint.radius;
    // Control rotational velocity.
    double Omega = mSpeed * AvgK;
    double yawratediff = Omega - oCar->_yaw_rate;
    if (fabs(yawratediff) > 0.2) {
      mControlYawRate = true;
      targetangle += 0.09 * (Omega - oCar->_yaw_rate);
      NORM_PI_PI(targetangle);
    }
  }
}


bool TDriver::hysteresis(bool lastout, double in, double hyst)
{
  if (lastout == false) {
    if (in > hyst) {
      return true;
    } else {
      return false;
    }
  } else {
    if (in < -hyst) {
      return false;
    } else {
      return true;
    }
  }
}


double TDriver::getFuel(double dist)
{
  double fueltoend = dist * mFuelPerMeter;
  double fuel = MAX(MIN(fueltoend, mTankvol), 0.0);
  return fuel;
}


void TDriver::saveFile()
{
  char dirname[256];
  std::sprintf(dirname, "%s/drivers/%s/%s/learned/",GetLocalDir() ,MyBotName, mCarType.c_str());
#ifdef TARGET_TORCS
  if (GfCreateDir(strdup(dirname)) == GF_DIR_CREATED) {
#else
  if (GfDirCreate(strdup(dirname)) == GF_DIR_CREATED) {
#endif
    saveSectorSpeeds();
  } else {
    driverMsg("Error saveFile: unable to create user dir");
  }
}


void TDriver::saveSectorSpeeds()
{
  char filename[256];
  std::sprintf(filename, "%sdrivers/%s/%s/learned/%s.csv", GetLocalDir(), MyBotName, mCarType.c_str(), mTrack->internalname);
  std::ofstream myfile;
  myfile.open (filename);
  for (int i = 0; i < (int)mSect.size(); i++) {
    myfile << mSect[i].sector << std::endl;
    myfile << mSect[i].fromstart << std::endl;
    myfile << mSect[i].speedfactor << std::endl;
    myfile << mSect[i].time << std::endl;
    myfile << mSect[i].bestspeedfactor << std::endl;
    myfile << mSect[i].besttime << std::endl;
    myfile << mSect[i].learned << std::endl;
  }
  myfile.close();
}


bool TDriver::readSectorSpeeds()
{
  char filename[256];
  if (mLearning) {
    std::sprintf(filename, "%sdrivers/%s/%s/learned/%s.csv", GetLocalDir(), MyBotName, mCarType.c_str(), mTrack->internalname);
  } else {
    std::sprintf(filename, "%sdrivers/%s/%s/learned/%s.csv", GetDataDir(), MyBotName, mCarType.c_str(), mTrack->internalname);
  }

  DanSector sect;
  std::string line;
  std::ifstream myfile(filename);
  if (myfile.is_open()) {
    while (myfile >> sect.sector >> sect.fromstart >> sect.speedfactor >> sect.time >> sect.bestspeedfactor >> sect.besttime >> sect.learned) {     
      if (mLearning) {
        GfOut("S:%d l:%d fs:%g t:%g bt:%g sf:%g bsf:%g\n", sect.sector, sect.learned, sect.fromstart, sect.time, sect.besttime, sect.speedfactor, sect.bestspeedfactor);
      }
      mSect.push_back(sect);
    }
    myfile.close();
    return true;
  } else {
    driverMsg("readSectorSpeeds(): no csv file found");
    return false;
  }
}


void TDriver::driverMsg(std::string desc)
{
  GfOut("%s %s\n", oCar->_name, desc.c_str());
}


void TDriver::driverMsgValue(int priority, std::string desc, double value)
{
  if (priority <= mDriverMsgLevel && mCarIndex == mDriverMsgCarIndex) {
    GfOut("%dm %s s:%d p:%d %s %g\n", (int)mFromStart, oCar->_name, mDrvState, mDrvPath, desc.c_str(), value);
  }
}
