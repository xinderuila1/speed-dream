/***************************************************************************

    file                 : OsgWing.h
    created              : Mon Dec 1 18:24:02 CEST 2014
    copyright            : (C) 2014 by Xavier Bertaux
    email                : bertauxx@yahoo.fr
    version              : $Id$

***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef _OSWING_H_
#define _OSWING_H_

#include <car.h>
#include <raceman.h>
#include <osg/Group>
#include <osg/Node>
#include <osg/Switch>

class SDWing
{
private :
    tCarElt *car;

    unsigned int rcvShadowMask;
    unsigned int castShadowMask;

public :
    SDWing();
    ~SDWing();
    osg::ref_ptr<osg::Switch> initWing(tCarElt *car,void * handle, bool tracktype);
};

#endif /* _OSGWING_H_ */
