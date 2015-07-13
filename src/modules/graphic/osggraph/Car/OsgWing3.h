/***************************************************************************

    file                 : OsgWing3.h
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

#ifndef _OSGWING3_H_
#define _OSGWING3_H_

#include <car.h>
#include <raceman.h>
#include <osg/Group>
#include <osg/Node>
#include <osg/Switch>
#include <osg/MatrixTransform>
#include <vector>

class SDWing3
{
private :
    tCarElt *car;
    osg::ref_ptr<osg::Switch> _wing3Switch;

    unsigned int rcvShadowMask;
    unsigned int castShadowMask;

public :
    SDWing3();
    ~SDWing3();

    osg::ref_ptr<osg::Switch> initWing3(tCarElt *car,void * handle);
    void updateWing3();
};

#endif /* _OSGWING3_H_ */
