/***************************************************************************

    file        : PitControl.cpp
    created     : 9 Apr 2006
    copyright   : (C) 2006 Tim Foden

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

// PitControl.cpp: implementation of the PitControl class.
//
//////////////////////////////////////////////////////////////////////

#include <robottools.h>

#include "PitControl.h"
#include "Utils.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

PitControl::PitControl( const MyTrack& track, const PitPath& pitPath )
:	m_track(track),
	m_pitPath(pitPath),
	m_state(PIT_NONE),
	m_lastFuel(0),
	m_totalFuel(0),
	m_totalLaps(0)
{
}

PitControl::~PitControl()
{
}

void PitControl::Process( CarElt* pCar )
{
	//
	//	update statistics.
	//

	if( pCar->_fuel > m_lastFuel || pCar->_dammage < m_lastDamage )
	{
		// been in pits... reset.
//		GfOut( "***** Been in pits... resetting stats.\n" );
		m_lastFuel = pCar->_fuel;
		m_lastDamage = pCar->_dammage;
	}
	else 
	{
		if( pCar->_fuel < m_lastFuel )
		{
			m_totalFuel += (m_lastFuel - pCar->_fuel);
			m_lastFuel = pCar->_fuel;
		}

		if( pCar->_dammage > m_lastDamage )
		{
			m_totalDamage += (pCar->_dammage - m_lastDamage);
			m_lastDamage = pCar->_dammage;
		}
	}

	//
	//	work out fuel economy, and damage rate.
	//

	double	fuelPerM = 0.001;
	double	damagePerM = 0;
	if( pCar->_distRaced > 0 )
	{
		fuelPerM = m_totalFuel / pCar->_distRaced;
		damagePerM = m_totalDamage / pCar->_distRaced;
	}

	//
	//	decide if we want to pit.
	//

	int		raceLaps = pCar->_laps + pCar->_remainingLaps;
	double	trackLen = m_track.GetLength();
	double	distToRace = trackLen * raceLaps - pCar->_distRaced;
	double	fuelForRace = 1.1 * fuelPerM * distToRace - pCar->_fuel;
	int		nPitsForFuel = int(ceil(fuelForRace / pCar->_tank));
	double	fuelIfPitNow = fuelForRace - (pCar->_tank - pCar->_fuel);
	int		nPitsIfPitNow = 1 + int(ceil(fuelIfPitNow / pCar->_tank));

	bool	delayRepair = nPitsForFuel < nPitsIfPitNow;
	double	repairLimit = delayRepair ? 7000 : 5000;

	double	fuelPerLap = fuelPerM * trackLen;
    //double	damagePerLap = damagePerM * trackLen;

//	bool	likeToPit = pCar->_dammage >=  500 || pCar->_fuel < 90;
//	bool	likeToPit = pCar->_dammage + damagePerLap >= repairLimit ||
	bool	likeToPit = pCar->_dammage >= repairLimit ||
						pCar->_fuel < fuelPerLap * 1.5;
//	likeToPit = true;

	// pitting on the last lap is a silly thing to do (think about it!).
//	GfOut( "******* remaining laps %d\n", pCar->race.remainingLaps );
	int	remainingLaps = pCar->race.remainingLaps + 1;
	if( remainingLaps <= 1 )
		likeToPit = false;

	//
	//	manage the pit state.
	//

	double	trackPos = RtGetDistFromStart(pCar);

	switch( m_state )
	{
		case PIT_NONE:
			if( !m_pitPath.InPitSection(trackPos) && likeToPit )
			{
				// let's stop in the pits.
				m_state = PIT_BEFORE;
//				GfOut( "***** PIT_ENTER\n " );
			}
			break;

		case PIT_BEFORE:
			if( m_pitPath.InPitSection(trackPos) && likeToPit )
			{
				m_state = PIT_ENTER;
			}
			break;

		case PIT_ENTER:
//			if( pCar->ctrl.brakeCmd > 0.1 && pCar->ctrl.brakeCmd < 0.5 )
//				pCar->ctrl.brakeCmd = 0.5;

			if( !m_pitPath.CanStop(trackPos) )
				break;

			pCar->ctrl.raceCmd = RM_CMD_PIT_ASKED;
			m_state = PIT_ASKED;
//			GfOut( "****** PIT_ASKED\n" );

			// falls through...

		case PIT_ASKED:
			if( m_pitPath.CanStop(trackPos) &&
				(pCar->ctrl.raceCmd & RM_CMD_PIT_ASKED) )
			{
				// stop.
				pCar->ctrl.accelCmd = 0;
				pCar->ctrl.brakeCmd = 0.25;

				PtInfo	pi;
				m_pitPath.GetPtInfo( trackPos, pi );
				if( //(pi.offs - pCar->_trkPos.toMiddle) > 0.5 &&
					pCar->_speed_x < 0.5 )
				{
					pCar->ctrl.accelCmd = 0.1f;
					pCar->ctrl.brakeCmd = 0;
				}

				double	fuel = distToRace * fuelPerM * 1.05 + fuelPerLap - pCar->_fuel;

				double	predDamage = pCar->_dammage + distToRace * damagePerM * 2;
		//		int		repair = int(ceil(predDamage - 5000));
				int		repair = pCar->_dammage;

				double	distWithMaxFuel = pCar->_tank / fuelPerM;
				if( nPitsForFuel <= 1 && distToRace < distWithMaxFuel / 2 )
					repair = int(ceil(predDamage - 4000));

				pCar->pitcmd.fuel     = MX(0, MN(fuel, pCar->_tank - pCar->_fuel));
				pCar->pitcmd.repair   = MX(0, MN(repair, pCar->_dammage));
				pCar->pitcmd.stopType = RM_PIT_REPAIR;

//				GfOut( "****** PIT  fuel %g   pd %g   repair %d\n",
//						pCar->pitcmd.fuel, predDamage, pCar->pitcmd.repair );
			}
			else
			{
				// pit stop finished -- need to exit pits now.
				m_state = PIT_EXIT;
//				GfOut( "***** PIT_EXIT\n " );
			}
			break;

		case PIT_EXIT:
			if( !m_pitPath.InPitSection(trackPos) )
			{
				m_state = PIT_NONE;
//				GfOut( "***** PIT_NONE\n " );
			}
			else if( m_pitPath.CanStop(trackPos) )
			{
				// go.
				pCar->ctrl.accelCmd = 0.5;
				pCar->ctrl.brakeCmd = 0;
			}

			break;
	}
}

bool PitControl::WantToPit() const
{
	return m_state >= PIT_ENTER && m_state <= PIT_EXIT;
//	return true;
}

