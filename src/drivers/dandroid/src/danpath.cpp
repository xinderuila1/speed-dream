/***************************************************************************

    file                 : danpath.cpp
    created              : 2011-11-14 07:39:00 UTC
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


#include "danpath.h"

#include "ClothoidPath.h"
#include "Utils.h"

//#define DANPATH_VERBOSE


DanLine::DanLine(PTrack t)
{
  MAX_RADIUS = 1000.0;
  mTrack = t;
  myseg = mTrack->seg;
}


void DanLine::addDanPoint(DanPoint danpoint)
{
  mDanpath.push_back(danpoint);
}


bool DanLine::calcParam()
{
  int i;
  for (i = 0; i < (int)mDanpath.size(); i++) {
    if (fromStart(mDanpath[i].pos, mDanpath[i].fromstart)) {
      if (!toMiddle(mDanpath[i].pos, mDanpath[i].tomiddle)) {
        return false;
      }
    } else {
      return false;
    }
  }
  for (i = 0; i < (int)mDanpath.size(); i++) {
    mDanpath[i].yaw = calcYaw(mDanpath[i]);
    double trackyaw;
    if (!calcTrackYaw(mDanpath[i], trackyaw)) {
      return false;
    }
    mDanpath[i].angletotrack = mDanpath[i].yaw - trackyaw;
    NORM_PI_PI(mDanpath[i].angletotrack);
  }
  for (i = 0; i < (int)mDanpath.size(); i++) {
    mDanpath[i].radius = calcRadius(i);
    if (fabs(mDanpath[i].radius) < MAX_RADIUS) {
      mDanpath[i].type = (SIGN(mDanpath[i].radius) > 0) ? TR_LFT : TR_RGT;
    } else {
      mDanpath[i].type = TR_STR;
    }
  }
  return true;
}


void DanLine::createSectors()
{
  int sector = 0;
  DanSector dansect;
  dansect.sector = sector;
  dansect.fromstart = 0.0;
  dansect.speedfactor = 0.8;
  dansect.time = 0.0;
  dansect.bestspeedfactor = 0.8;
  dansect.besttime = 10000.0;
  dansect.learned = 0;
  mDansect.push_back(dansect);
  double lastfromstart = dansect.fromstart;
  bool radiuspeek = false;
  bool largeradius = false;
  for (int i = 1 ; i < (int)mDanpath.size(); i++) {
    if (SIGN(mDanpath[i-1].radius) != SIGN(mDanpath[i].radius) || fabs(mDanpath[i].radius) < 200.0) {
      largeradius = false;
    }
    if (SIGN(mDanpath[i-1].radius) != SIGN(mDanpath[i].radius) || fabs(mDanpath[i].radius) > 200.0) {
      if (!largeradius) {
        radiuspeek = true;
      }
      if (fabs(mDanpath[i].radius) > 200.0) {
        largeradius = true;
      }
    }

    if (radiuspeek) {
      if (mDanpath[i].fromstart - lastfromstart > 100.0
        && mDanpath[mDanpath.size()-1].fromstart - mDanpath[i].fromstart > 100.0) {
        sector++;
        dansect.sector = sector;
        dansect.fromstart = mDanpath[i].fromstart;
        lastfromstart = dansect.fromstart;
        mDansect.push_back(dansect);
        //GfOut("fs:%g radius:%g delta:%g\n", mDanpath[i].fromstart, fabs(mDanpath[i].radius), fabs(mDanpath[i-1].radius) - fabs(mDanpath[i].radius));
      }
      radiuspeek = false;
    }
  }
  printData();
}


void DanLine::printData()
{
#ifdef DANPATH_VERBOSE
  if (mDanpath[0].line == 0) {
    for (int i = 0; i < (int)mDanpath.size(); i++) {
      GfOut("ind:%d fs:%g r:%g curv_z:%g\n", i, mDanpath[i].fromstart, mDanpath[i].radius, mDanpath[i].curv_z);
    }
    for (int i = 0; i < (int)mDansect.size(); i++) {
      GfOut("sector:%d fs:%g speedfactor:%g\n", mDansect[i].sector, mDansect[i].fromstart, mDansect[i].speedfactor);
    }
  }
#endif
}


bool DanLine::getDanPos(double fromstart, DanPoint& danpoint)
{
  if (!mDanpath.size()) {
    return false;
  }
  int index = getIndex(fromstart);
  danpoint = mDanpath[index];
  // Interpolate radius linear
  double seglength = getDistDiff(mDanpath[index].fromstart, nextPos(mDanpath[index]).fromstart);
  double poslength = getDistDiff(mDanpath[index].fromstart, fromstart);
  double invradius = 1.0 / mDanpath[index].radius + (poslength / seglength) * (1.0 / nextPos(mDanpath[index]).radius - 1.0 / mDanpath[index].radius);
  danpoint.radius = 1.0 / invradius;
  danpoint.tomiddle = getToMiddle(fromstart); // Interpolate cubic toMiddle
  danpoint.pos = getNearestPoint(danpoint.index, fromstart); // position (straight interpolation)
  danpoint.fromstart = fromstart;
  //danpoint.yaw = calcYaw(danpoint); // useless without interpolation
  return true;
}


bool DanLine::getLocalPos(PTrackSeg segment, DanPoint danpoint, tTrkLocPos* locpos)
{
  RtTrackGlobal2Local(segment, danpoint.pos.x, danpoint.pos.y, locpos, TR_LPOS_MAIN);
  locpos->toMiddle = danpoint.tomiddle;
  return true;
}


DanPoint DanLine::nextPos(DanPoint danpoint)
{
  danpoint.index++;
  return getPos(danpoint.index);
}


DanPoint DanLine::prevPos(DanPoint danpoint)
{
  danpoint.index--;
  return getPos(danpoint.index);
}


DanPoint DanLine::getPos(int index)
{
  if (index < 0) {
    return mDanpath[mDanpath.size() - 1];
  } else if (index >= (int)mDanpath.size()) {
    return mDanpath[0];
  } else {
    return mDanpath[index];
  }
}


double DanLine::calcRadius(int index)
{
  // Do nothing if no track loaded
  if (!mDanpath.size()) {
    return 0.0;
  }
  DanPoint nextpoint = nextPos(mDanpath[index]);
  Vec2d nextvect = nextpoint.pos - mDanpath[index].pos;
  double nextyaw = Utils::VecAngle(nextvect);
  double deltaangle = nextyaw - mDanpath[index].yaw;
  NORM_PI_PI(deltaangle);
  double radius = SIGN(deltaangle) * (nextvect.len()/2)/cos(PI/2 - fabs(deltaangle));
  if (fabs(radius) > MAX_RADIUS) {
    radius = SIGN(radius) * MAX_RADIUS;
  }
  return radius;
}


double DanLine::calcYaw(DanPoint danpoint)
{
  Vec2d prev = danpoint.pos - prevPos(danpoint).pos;
  Vec2d next = nextPos(danpoint).pos - danpoint.pos;
  return Utils::VecAngle(prev + next);
}


double DanLine::calcTrackYaw(DanPoint danpoint, double& trackyaw)
{
  tTrkLocPos locpos;
  RtTrackGlobal2Local(myseg, danpoint.pos.x, danpoint.pos.y, &locpos, TR_LPOS_MAIN);
  myseg = locpos.seg;
  trackyaw = RtTrackSideTgAngleL(&locpos);
  return true;
}


bool DanLine::fromStart(Vec2d pos, double& fromstart)
{
  tTrkLocPos locpos;
  RtTrackGlobal2Local(myseg, pos.x, pos.y, &locpos, TR_LPOS_MAIN);
  myseg = locpos.seg;
  fromstart = RtGetDistFromStart2(&locpos);
  return true;
}


bool DanLine::toMiddle(Vec2d pos, double& tomiddle)
{
  tTrkLocPos locpos;
  RtTrackGlobal2Local(myseg, pos.x, pos.y, &locpos, TR_LPOS_MAIN);
  myseg = locpos.seg;
  tomiddle = locpos.toMiddle;
  return true;
}


// Find nearest section on mDanpath
int DanLine::getIndex(double fromstart)
{
  double estpos = fromstart / mTrack->length;
  int i = (int)floor(estpos * mDanpath.size());
  while (true) {
    if (i < 0) {
      i = mDanpath.size() - 1;
    } else if (i >= (int)mDanpath.size()) {
      i = 0;
    }
    double sectlen = getDistDiff(getPos(i).fromstart, getPos(i + 1).fromstart);
//    double poslen = getDistDiff(getPos(i).fromstart, fromstart);
    double poslen = getDistDiff(getPos(i).fromstart, fromstart+0.001);
    if (poslen >= 0.0 && poslen <= sectlen) {
      //GfOut("poslen:%g sectlen:%g", poslen, sectlen);
      break;
    }
    i += (int)SIGN(poslen);
  }
  return i;
}


Vec2d DanLine::getNearestPoint(int index, double fromstart)
{
  Vec2d straight = getPos(index+1).pos - mDanpath[index].pos;
  double straightlen = getDistDiff(mDanpath[index].fromstart, getPos(index+1).fromstart);
  double poslen = getDistDiff(mDanpath[index].fromstart, fromstart);
  Vec2d pointonStraight = mDanpath[index].pos + straight * (poslen / straightlen);
  return pointonStraight;
}


double DanLine::getToMiddle(double fromstart)
{
  int index = getIndex(fromstart);
  TCubic ccurve(mDanpath[index].fromstart, mDanpath[index].tomiddle, mDanpath[index].angletotrack, nextPos(mDanpath[index]).fromstart, nextPos(mDanpath[index]).tomiddle, nextPos(mDanpath[index]).angletotrack);
  return ccurve.CalcOffset(fromstart);
}


double DanLine::getDistDiff(double fromstart1, double fromstart2)
{
  double diff = fromstart2 - fromstart1;
  diff = (diff >= 0.0) ? diff : diff + mTrack->length;
  return (diff <= mTrack->length / 2.0) ? diff : diff - mTrack->length;
}




DanPath::DanPath(PTrack t, double max_left, double max_right, double factor)
{
  mTrack = t;
  mMaxL = max_left;
  mMaxR = max_right;
  mClothFactor = factor;

  for (int i=0; i < NUM_LINES; i++) {
    mDanLine[i] = new DanLine(t);
  }

  getClothPath();

  for (int i=0; i < NUM_LINES; i++) {
    if (!mDanLine[i]->calcParam()) {
      GfOut("Error danpath: calcParam() failed\n");
    }
  }
  mDanLine[0]->createSectors();
}


DanPath::~DanPath()
{
  for (int i=0; i < NUM_LINES; i++) {
    delete mDanLine[i];
  }
}


bool DanPath::getDanPos(int line, double fromstart, DanPoint& danpoint)
{
  return mDanLine[line]->getDanPos(fromstart, danpoint);
}


bool DanPath::getLocalPos(PTrackSeg segment, DanPoint danpoint, tTrkLocPos* locpos)
{
  return mDanLine[danpoint.line]->getLocalPos(segment, danpoint, locpos);
}


DanPoint DanPath::nextPos(DanPoint danpoint)
{
  return mDanLine[danpoint.line]->nextPos(danpoint);
}


void DanPath::getClothPath()
{
  Vec2d point(0, 0);

  MyTrack* pTrack = new MyTrack();
  pTrack->NewTrack(mTrack);
  for (int l = 0; l < NUM_LINES; l++) {
    ClothoidPath* clpath = new ClothoidPath(mClothFactor);
    if (l == IDEAL_LINE ) {
      clpath->MakeSmoothPath(pTrack, ClothoidPath::Options(0, mMaxL, mMaxR));
    }
    if (l == LEFT_LINE ) {
      clpath->MakeSmoothPath(pTrack, ClothoidPath::Options(0, mMaxL, -1.0));
    }
    if (l == RIGHT_LINE) {
      clpath->MakeSmoothPath(pTrack, ClothoidPath::Options(0, -1.0, mMaxR));
    }
    LinePath::PathPt pathpoint;
    int index = 0;
    for (int j = 0; j < pTrack->GetSize(); j++) {
      pathpoint = clpath->GetAt(j);
      point.x = pathpoint.pt.x;
      point.y = pathpoint.pt.y;
      DanPoint p;
      p.line = l;
      p.index = index++;
      p.pos = point;
      p.type = 0;
      p.fromstart = 0;
      p.tomiddle = 0;
      p.radius = 0;
      p.yaw = 0;
      p.angletotrack = 0;
      p.curv_z = pathpoint.kz;
      mDanLine[l]->addDanPoint(p);
    }
    delete clpath;
  }
  delete pTrack;
}
