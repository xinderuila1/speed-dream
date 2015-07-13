/***************************************************************************

    file                 : OsgWing3.cpp
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

/* Portability don't build with MingW 4.8 */
#ifdef _MSC_VER
#include <portability.h>
#endif // _MSC_VER

#include "OsgLoader.h"
#include "OsgWing3.h"
#include <osgDB/WriteFile>

SDWing3::SDWing3(void)
{
}

SDWing3::~SDWing3(void)
{
    _wing3Switch->removeChildren(0, _wing3Switch->getNumChildren());
    _wing3Switch = NULL;
}

osg::ref_ptr<osg::Switch> SDWing3::initWing3(tCarElt *car,void *handle)
{
    rcvShadowMask = 0x1;
    castShadowMask = 0x2;
    this->car = car;

    _wing3Switch = new osg::Switch;

    char path[256];

    snprintf(path, 256, "%s/%s", SECT_GROBJECTS, LST_REARWING);
    int nranges = GfParmGetEltNb(handle, path) + 1;

    if (nranges > 1)
    {
        osg::ref_ptr<osg::Node> rearwingBody1 = new osg::Node;
        osg::ref_ptr<osg::Node> rearwingBody2 = new osg::Node;
        osg::ref_ptr<osg::Node> rearwingBody3 = new osg::Node;

        osgLoader loader;
        char buf[4096];

        std::string TmpPath = GetDataDir();
        std::string strTPath;
        std::string strPath;

        snprintf(buf, 4096, "drivers/%s/%d/", car->_modName, car->_driverIndex);
        strTPath = TmpPath+buf;
        loader.AddSearchPath(strTPath);

        snprintf(buf, 4096, "cars/models/%s/", car->_carName);
        strTPath = TmpPath+buf;
        loader.AddSearchPath(strTPath);
        GfOut("Chemin Textures : %s\n", strTPath.c_str());

        strPath = GetDataDir();
        sprintf(buf, "cars/models/%s/%s-wing-05-src.ac", car->_carName, car->_carName);
        strPath+=buf;
        rearwingBody1 = loader.Load3dFile(strPath, true);

        strPath = GetDataDir();
        snprintf(buf, 4096, "cars/models/%s/%s-wing-15-src.ac", car->_carName, car->_carName);
        strPath+=buf;
        rearwingBody2 = loader.Load3dFile(strPath, true);

        strPath = GetDataDir();
        snprintf(buf, 4096, "cars/models/%s/%s-wing-ab-src.ac", car->_carName, car->_carName);
        strPath+=buf;
        rearwingBody3 = loader.Load3dFile(strPath, true);

        _wing3Switch->addChild( rearwingBody1.get(), true);
        _wing3Switch->addChild( rearwingBody2.get(), false);
        _wing3Switch->addChild( rearwingBody1.get(), false);
        _wing3Switch->setSingleChildOn(0);

#if 1
        std::string pWing3_path = GetLocalDir();
        pWing3_path = pWing3_path+"wing3.osg";
        osgDB::writeNodeFile( *_wing3Switch, pWing3_path );
#endif
    }

    GfLogInfo("Rear Wing angle Loaded\n");

    return _wing3Switch.get();
}
