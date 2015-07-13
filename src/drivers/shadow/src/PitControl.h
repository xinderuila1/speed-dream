/***************************************************************************

    file        : PitControl.h
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

#ifndef _PITCONTROL_H_
#define _PITCONTROL_H_

#include "MyTrack.h"
#include "PitPath.h"

class PitControl  
{
public:
	PitControl( const MyTrack& track, const PitPath& pitPath );
	~PitControl();

	void	Process( CarElt* pCar );

	bool	WantToPit() const;

private:
	enum
	{
		PIT_NONE,
		PIT_BEFORE,
		PIT_ENTER,
		PIT_ASKED,
		PIT_EXIT,
	};

private:
	const MyTrack&	m_track;
	const PitPath&	m_pitPath;

	int				m_state;

	double			m_lastFuel;
	double			m_totalFuel;
	double			m_lastDamage;
	double			m_totalDamage;
	int				m_lastLap;
	int				m_totalLaps;
};

#endif
