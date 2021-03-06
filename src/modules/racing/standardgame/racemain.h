/***************************************************************************

    file        : racemain.h
    created     : Sat Nov 16 12:14:57 CET 2002
    copyright   : (C) 2002 by Eric Espi�                        
    email       : eric.espie@torcs.org   
    version     : $Id: racemain.h 5812 2014-10-27 23:16:06Z beaglejoe $                                  

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
 
/** @file    
    		
    @author	<a href=mailto:torcs@free.fr>Eric Espie</a>
    @version	$Id: racemain.h 5812 2014-10-27 23:16:06Z beaglejoe $
*/

#ifndef _RACEMAIN_H_
#define _RACEMAIN_H_

extern bool ReHumanInGroup();
#if defined(STARTPAUSED) || defined(COOLDOWN)
extern bool ReSessionHasHuman();
#endif

extern int  ReConfigure();
extern int  ReRaceEventInit();
extern int  RePreRace();
#ifdef STARTPAUSED
extern int  RePreRacePause();
#endif
#ifdef COOLDOWN
extern int ReRaceCooldown();
extern void ReStopCooldown();
#endif
extern int  ReRaceStart();
extern int  ReRaceRealStart();
extern int  ReRaceStop();
extern int  ReRaceEnd();
extern int  RePostRace();
extern int  ReRaceEventShutdown();
extern bool ReCleanupStandardgame();
extern void ReRaceAbandon();
extern void ReRaceAbort();
extern void ReRaceSkipSession();
extern void ReRaceRestart();

#ifdef STARTPAUSED
extern void ReStopPreracePause();
#endif

#endif /* _RACEMAIN_H_ */ 



