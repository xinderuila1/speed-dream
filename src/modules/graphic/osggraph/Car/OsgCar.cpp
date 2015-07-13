/***************************************************************************

    file                 : OsgCar.cpp
    created              : Mon Aug 21 18:24:02 CEST 2012
    copyright            : (C)2012 by Gaétan André, (C)2014 Xavier Bertaux
    email                : gaetan.andre@gmail.com
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

#include <osgUtil/Optimizer>
#include <osg/MatrixTransform>
#include <osg/Switch>
#include <osg/Group>
#include <osgViewer/Viewer>
#include <osg/Program>
#include <osg/Geode>
#include <osg/Geometry>
#include <portability.h>
#include <osg/Texture2D>
#include <osg/BlendFunc>
#include <osg/Depth>
#include <osgDB/ReadFile>
#include <osgDB/WriteFile>

#include <robottools.h>

#include "OsgLoader.h"
#include "OsgCar.h"
#include "OsgMath.h"
#include "OsgScreens.h"
#include "OsgRender.h"
#include "OsgMain.h"
#include "OsgSky.h"
#include "OsgShader.h"
#include "OsgReflectionMapping.h"

class SDRender;

SDCar::SDCar(void) :
	car_branch(NULL),
	car_root(NULL),
    shader(NULL),
    reflectionMapping(NULL)
{
    _cockpit = false;
    _driver = false;
    _wing1 = false;
    _wing3 = false;
    _steer = false;

    _carShader = 0;
}

SDCar::~SDCar(void)
{
    car_root->removeChildren(0, car_root->getNumChildren());
    car_root = NULL;

    delete shader;
    delete reflectionMapping;
}

osg::ref_ptr<osg::Node> SDCar::loadCar(tCarElt *car, bool tracktype, bool subcat, int carshader)
{
	this->car_branch = new osg::MatrixTransform;
	this->car_root = new osg::Group;
    this->car = car;

    static const int nMaxTexPathSize = 512;
    char buf[nMaxTexPathSize];
    int index;
    void *handle;
    const char *param;

    int nranges = 0;
    rcvShadowMask = 0x1;
    castShadowMask = 0x2;
    char path[nMaxTexPathSize];

    _carShader = carshader;

#if 1
    osgLoader loader;

    std::string TmpPath = GetDataDir();
    std::string strTPath;

    index = car->index;	/* current car's index */
    handle = car->_carHandle;

    GfLogInfo("[gr] Init(%d) car %s for driver %s index %d\n", index, car->_carName, car->_modName, car->_driverIndex);
    GfLogInfo("[gr] Init(%d) car %s MasterModel name\n", index, car->_masterModel);

    snprintf(buf, nMaxTexPathSize, "%sdrivers/%s/%d/",
             GfDataDir(), car->_modName, car->_driverIndex);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "%sdrivers/%s/%s/",
             GfDataDir(), car->_modName, car->_carName);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "%sdrivers/%s/",
             GfDataDir(), car->_modName);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "drivers/%s/%d/%s/",
             car->_modName, car->_driverIndex, car->_carName);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);
    
    snprintf(buf, nMaxTexPathSize, "drivers/%s/%d/",
             car->_modName, car->_driverIndex);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "drivers/%s/%s/",
             car->_modName, car->_carName);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "drivers/%s/", car->_modName);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "cars/models/%s/", car->_carName);
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "data/objects/");
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    snprintf(buf, nMaxTexPathSize, "data/textures/");
    strTPath = TmpPath+buf;
    loader.AddSearchPath(strTPath);

    /* loading raw car level 0*/
    //  selIndex = 0; 	/* current selector index */
    snprintf(buf, nMaxTexPathSize, "%s.ac",
             car->_carName); /* default car 3D model file */
    snprintf(path, nMaxTexPathSize, "%s/%s/1", SECT_GROBJECTS, LST_RANGES);

    std::string strPath = GetDataDir();
    snprintf(buf, nMaxTexPathSize, "cars/models/%s/%s.acc", car->_carName, car->_carName);
    strPath+=buf;

    std::string name = car->_carName;

    osg::ref_ptr<osg::Group> gCar = new osg::Group;
    gCar->setName("CAR");
    osg::ref_ptr<osg::Switch> pBody =new osg::Switch;
    pBody->setName("COCK");
    osg::ref_ptr<osg::Node> pCar = new osg::Node;
    osg::ref_ptr<osg::Node> pCockpit = new osg::Node;
    osg::ref_ptr<osg::Switch> pWing = new osg::Switch;
    pWing->setName("WING");
    osg::ref_ptr<osg::Switch> pWing3 = new osg::Switch;
    pWing->setName("WINGREAR");
    osg::ref_ptr<osg::Switch> pDriver = new osg::Switch;
    pDriver->setName("DRIVER");
    osg::ref_ptr<osg::Switch> pSteer = new osg::Switch;
    pSteer->setName("STEER");
    osg::ref_ptr<osg::Group> pHiSteer = new osg::Switch;
    pHiSteer->setName("HISTEER");

    strPath+=buf;
    GfLogInfo("Chemin Textures : %s\n", strTPath.c_str());

    //osg::ref_ptr<osg::Node> Car = new osg::Node;
    pCar = loader.Load3dFile(strPath, true);

    //pCar->addChild(Car.get());
#if 0
    std::string pCar_path = GetLocalDir();
    pCar_path = pCar_path+name+".osg";
    osgDB::writeNodeFile( *pCar, pCar_path );
#endif

    GfLogInfo("Load Car ACC !\n");

    /* Set a selector on the wing type MPA*/
    snprintf(path, nMaxTexPathSize, "%s/%s", SECT_GROBJECTS, SECT_WING_MODEL);
    param = GfParmGetStr(handle, path, PRM_WING_1, NULL);
    if (param)
    {
        osg::ref_ptr<osg::Node> pWin1 = new osg::Node;
        osg::ref_ptr<osg::Node> pWin2 = new osg::Node;
        osg::ref_ptr<osg::Node> pWin3 = new osg::Node;

        _wing1 = true;

        std::string tmp = GetDataDir();
        snprintf(buf, nMaxTexPathSize, "cars/models/%s/", car->_carName);
        tmp = tmp+buf;

        param = GfParmGetStr(handle, path, PRM_WING_1, NULL);
        strPath=tmp+param;
        pWin1 = loader.Load3dFile(strPath, true);
        pWin1->setName("WING1");
        GfLogInfo("Load Wing1 ACC ! %s\n", strPath.c_str() );

        param = GfParmGetStr(handle, path, PRM_WING_2, NULL);
        strPath=tmp+param;
        pWin2 = loader.Load3dFile(strPath, true);
        pWin2->setName("WING2");
        GfLogInfo("Load Wing2 ACC ! %s\n", strPath.c_str());

        param = GfParmGetStr(handle, path, PRM_WING_3, NULL);
        strPath=tmp+param;
        pWin3 = loader.Load3dFile(strPath, true);
        pWin3->setName("WING3");
        GfLogInfo("Load Wing3 ACC ! %s\n", strPath.c_str());

        pWing->addChild(pWin1.get(), false);
        pWing->addChild(pWin2.get(), false);
        pWing->addChild(pWin3.get(), true);

        GfLogInfo("tracktype = %d - subcat = %d\n", tracktype, subcat);

        if (tracktype == false)
        {
            pWing->setSingleChildOn(2);
            GfLogInfo("Activate Wing Road !\n");
        }
        else
        {
            if(subcat == false)
            {
                pWing->setSingleChildOn(0);
                GfLogInfo("Activate Wing Short !\n");
            }
            else
            {
                pWing->setSingleChildOn(1);
                GfLogInfo("Activate Wing Long !\n");
            }
        }
#if 0
        std::string pWing_path = GetLocalDir();
        pWing_path = pWing_path+"wing.osg";
        osgDB::writeNodeFile( *pWing, pWing_path );
#endif
    }

    // Separate rear wing models for animation according to rear wing angle ...
    snprintf(path, nMaxTexPathSize, "%s/%s", SECT_GROBJECTS, LST_REARWING);
    nranges = GfParmGetEltNb(handle, path) + 1;

    if (nranges > 1)
    {
        _wing3 = true;
        std::string tmp = GetDataDir();
        snprintf(buf, nMaxTexPathSize, "cars/models/%s/", car->_carName);
        tmp = tmp+buf;

        // Add the rearwings
        for (int i = 1; i < nranges; i++)
        {
            osg::ref_ptr<osg::Node> pWing1 = new osg::Node;
            osg::ref_ptr<osg::MatrixTransform> position = new osg::MatrixTransform;
            snprintf(path, nMaxTexPathSize, "%s/%s/%d", SECT_GROBJECTS, LST_REARWING, i);
            param = GfParmGetStr(handle, path, PRM_REARWINGMODEL, "");

            strPath = tmp+param;

            GfLogInfo("Loading Wing animate %i - %s !\n", i, strPath.c_str());

            tdble xpos = GfParmGetNum(handle, path, PRM_XPOS, NULL, 0.0);
            tdble ypos = GfParmGetNum(handle, path, PRM_YPOS, NULL, 0.0);
            tdble zpos = GfParmGetNum(handle, path, PRM_ZPOS, NULL, 0.0);
            osg::Matrix pos = osg::Matrix::translate(xpos, ypos, zpos);

            pWing1 = loader.Load3dFile(strPath, true);
			position->addChild(pWing1.get());
			pWing3->addChild(position.get());
            strPath ="";
        }

        pWing3->setSingleChildOn(0);
        GfLogInfo("Rear Wing angle Loaded\n");

#if 0
        std::string pWing3_path = GetLocalDir();
        pWing3_path = pWing3_path+"wing3.osg";
        osgDB::writeNodeFile( *pWing3, pWing3_path );
#endif
    }


    // Cockpit separate object loaded  ...
    snprintf(path, nMaxTexPathSize, "%s/%s", SECT_GROBJECTS, SECT_COCKPIT);
    param = GfParmGetStr(handle, path, PRM_MODELCOCKPIT, NULL);

    if (param)
    {
        _cockpit = true;
        std::string tmp = GetDataDir();
        snprintf(buf, nMaxTexPathSize, "cars/models/%s/", car->_carName);
        tmp = tmp+buf;

        strPath= tmp+param;

        pCockpit = loader.Load3dFile(strPath, true);
        GfLogInfo("Cockpit loaded = %s !\n", strPath.c_str());
#if 0
        std::string pCockpit_path = GetLocalDir();
        pCockpit_path = pCockpit_path+"cockpit.osg";
        osgDB::writeNodeFile( *cock, pCockpit_path );
#endif
    }

    pBody->addChild(pCockpit.get(), false);

    /* add Steering Wheel 0 (if one exists) */
    snprintf(path, nMaxTexPathSize, "%s/%s", SECT_GROBJECTS, SECT_STEERWHEEL);
    param = GfParmGetStr(handle, path, PRM_SW_MODEL, NULL);

    if (param)
    {
        _steer = true;
        std::string tmpPath = GetDataDir();
        snprintf(buf, nMaxTexPathSize, "cars/models/%s/", car->_carName);
        tmpPath = tmpPath+buf;

        strPath = tmpPath + param;

        osg::ref_ptr<osg::Node> steerEntityLo = loader.Load3dFile(strPath, true);
        osg::ref_ptr<osg::MatrixTransform> steer_transform = new osg::MatrixTransform;

        tdble xpos = GfParmGetNum(handle, path, PRM_XPOS, NULL, 0.0);
        tdble ypos = GfParmGetNum(handle, path, PRM_YPOS, NULL, 0.0);
        tdble zpos = GfParmGetNum(handle, path, PRM_ZPOS, NULL, 0.0);
        tdble angl = GfParmGetNum(handle, path, PRM_SW_ANGLE, NULL, 0.0);
        osg::Matrix pos = osg::Matrix::translate(xpos, ypos, zpos);
        osg::Matrix rot = osg::Matrix::rotate(angl, osg::Y_AXIS);

        pos = rot * pos;
        steer_transform->setMatrix(pos);

        steer_transform->addChild(steerEntityLo.get());
        pSteer->addChild(steer_transform.get(), true);
        GfLogTrace("Low Steer Loading \n");
    }

    snprintf(path, nMaxTexPathSize, "%s/%s", SECT_GROBJECTS, SECT_STEERWHEEL);
    param = GfParmGetStr(handle, path, PRM_SW_MODELHR, NULL);

    if (param)
    {
        _steer = true;
        std::string tmpPath = GetDataDir();
        snprintf(buf, nMaxTexPathSize, "cars/models/%s/", car->_carName);
        tmpPath = tmpPath+buf;

        strPath = tmpPath + param;

        osg::ref_ptr<osg::Node> steerEntityHi = loader.Load3dFile(strPath, true);
        osg::ref_ptr<osg::MatrixTransform> steer_transform = new osg::MatrixTransform;

        tdble xpos = GfParmGetNum(handle, path, PRM_XPOS, NULL, 0.0);
        tdble ypos = GfParmGetNum(handle, path, PRM_YPOS, NULL, 0.0);
        tdble zpos = GfParmGetNum(handle, path, PRM_ZPOS, NULL, 0.0);
        tdble angl = GfParmGetNum(handle, path, PRM_SW_ANGLE, NULL, 0.0);
        osg::Matrix pos = osg::Matrix::translate(xpos, ypos, zpos);
        osg::Matrix rot = osg::Matrix::rotate(angl, osg::Y_AXIS);

        pos = rot * pos;
        steer_transform->setMatrix(pos);

        steer_transform->addChild(steerEntityHi.get());
        pSteer->addChild(steer_transform.get(), false);
        GfLogTrace("High Steer Loading \n");
    }

    pSteer->setSingleChildOn(0);


    // separate driver models for animation according to steering wheel angle ...
    snprintf(path, nMaxTexPathSize, "%s/%s", SECT_GROBJECTS, LST_DRIVER);
    nranges = GfParmGetEltNb(handle, path) + 1;

    if (nranges > 1)
    {
        _driver = true;
        int selIndex = 0;
        std::string tmp = GetLocalDir();
        std::string driver_path;

        // add the drivers
        for (int i = 1; i < nranges; i++)
        {
            osg::ref_ptr<osg::Node> driver_branch = new osg::Node;
            osg::ref_ptr<osg::MatrixTransform> position = new osg::MatrixTransform;

            snprintf(buf, nMaxTexPathSize, "%s/%s/%d", SECT_GROBJECTS, LST_DRIVER, i);
            param = GfParmGetStr(handle, buf, PRM_DRIVERMODEL, "");

            tdble xpos = GfParmGetNum(handle, buf, PRM_XPOS, NULL, 0.0);
            tdble ypos = GfParmGetNum(handle, buf, PRM_YPOS, NULL, 0.0);
            tdble zpos = GfParmGetNum(handle, buf, PRM_ZPOS, NULL, 0.0);
            osg::Matrix pos = osg::Matrix::translate(xpos, ypos, zpos);

            driver_path = tmp+param;
            driver_branch = loader.Load3dFile(driver_path, true);
            GfLogInfo("Loading Animated Driver %i - %s \n", i, driver_path.c_str());

			position->addChild(driver_branch.get());
			pDriver->addChild(position.get());
            driver_path ="";

            selIndex++;
        }

        pDriver->setSingleChildOn(0);

#if 0
        std::string pDriver_path = GetLocalDir();
        pDriver_path = pDriver_path+"driver.osg";
        osgDB::writeNodeFile( *pDriver, pDriver_path );
#endif
    }

    gCar->addChild(pWing.get());
    gCar->addChild(pWing3.get());

    gCar->addChild(pCar.get());
    gCar->addChild(pDriver.get());
    gCar->addChild(pSteer.get());
#else

    osg::ref_ptr<osg::Group> gCar = new osg::Group;
    gCar->setName("CAR");
    osg::ref_ptr<osg::Switch> pBody =new osg::Switch;
    pBody->setName("COCK");
    osg::ref_ptr<osg::Node> pCar = new osg::Node;
    osg::ref_ptr<osg::Switch> pWing = new osg::Switch;
    pWing->setName("WING");
    osg::ref_ptr<osg::MatrixTransform> pWing3 = new osg::MatrixTransform;
    pWing->setName("WINGREAR");
    osg::ref_ptr<osg::Switch> pDriver = new osg::Switch;
    pDriver->setName("DRIVER");
    osg::ref_ptr<osg::Group> pSteer = new osg::Switch;
    pSteer->setName("STEER");
    osg::ref_ptr<osg::Group> pHiSteer = new osg::Switch;
    pHiSteer->setName("HISTEER");

    std::string LocalPath = GetDataDir();

    osg::ref_ptr<osgDB::Options> options = new::osgDB::ReaderWriter::Options();
    //options = new osgDB::ReaderWriter::Options;

    snprintf(buf, 4096, "drivers/%s/%d/", car->_modName, car->_driverIndex);
    options->getDatabasePathList().push_back(LocalPath+buf);

    snprintf(buf, 4096, "cars/models/%s/", car->_carName);
    options->getDatabasePathList().push_back(LocalPath+buf);

    options->getDatabasePathList().push_back(LocalPath+"data/textures/");
    options->getDatabasePathList().push_back(LocalPath+"data/objects/");

    gCar->addChild( osgDB::readNodeFile("sc-cavallo-360.osg", options));

    options->getDatabasePathList().clear();
#endif

    pBody->addChild(gCar.get(), true);
    pBody->setSingleChildOn(1);

    osg::ref_ptr<osg::MatrixTransform> transform1 = new osg::MatrixTransform;
    transform1->addChild(pBody.get());
    transform1->setNodeMask(rcvShadowMask | castShadowMask);

    // GfOut("loaded car %d",pCar.get());
    this->car_branch = transform1.get();

    //wheels = new SDWheels;
    this->car_branch->addChild(wheels.initWheels(car,handle));

    this->car_root = new osg::Group;
    car_root->addChild(car_branch);

    this->shader = new SDCarShader(pCar.get(), this);

    if (_carShader > 1)
        this->reflectionMappingMethod = REFLECTIONMAPPING_DYNAMIC;
    else
        this->reflectionMappingMethod = REFLECTIONMAPPING_OFF;

    this->reflectionMapping = new SDReflectionMapping(this);
    this->setReflectionMap(this->reflectionMapping->getReflectionMap());

    return this->car_root;
}

bool SDCar::isCar(tCarElt*c)
{
    return c==car;
}
SDReflectionMapping *SDCar::getReflectionMap()
{
    return this->reflectionMapping;
}

int SDCar::getReflectionMappingMethod()
{
    return this->reflectionMappingMethod;
}

tCarElt *SDCar::getCar()
{
    return car;
}

/*#define GR_SHADOW_POINTS 6
#define MULT 1.1
osg::ref_ptr<osg::Node> SDCar::initOcclusionQuad(tCarElt *car)
{
    osg::Vec3f vtx;
    osg::Vec2f tex;
    float x;
    int i;

    char buf[512];
    std::string TmpPath = GetDataDir();

    //  GfOut("\n################## LOADING SHADOW ###############################\n");
    std::string shadowTextureName = GfParmGetStr(car->_carHandle, SECT_GROBJECTS, PRM_SHADOW_TEXTURE, "");

    snprintf(buf, sizeof(buf), "cars/models/%s/", car->_carName);
    if (strlen(car->_masterModel) > 0) // Add the master model path if we are using a template.
        snprintf(buf + strlen(buf), sizeof(buf) - strlen(buf), "cars/models/%s/", car->_masterModel);

    std::string dir = buf;
    shadowTextureName = TmpPath +dir+shadowTextureName;

    // GfOut("\n lepath = %s\n",shadowTextureName.c_str());
    osg::ref_ptr<osg::Vec3Array> vertices = new osg::Vec3Array;
    osg::ref_ptr<osg::Vec2Array> texcoords = new osg::Vec2Array;
    vtx._v[2] = 0.0;

    for (i = 0, x = car->_dimension_x * MULT / 2.0; i < GR_SHADOW_POINTS / 2;
         i++, x -= car->_dimension_x * MULT / (float)(GR_SHADOW_POINTS - 2) * 2.0)
    {
        vtx._v[0] = x;
        tex._v[0] = 1.0 - (float)i / (float)((GR_SHADOW_POINTS - 2) / 2.0);

        vtx._v[1] = -car->_dimension_y * MULT / 2.0;
        vertices->push_back(vtx);
        tex._v[1] = 0.0;
        texcoords->push_back(tex);

        vtx._v[1] = car->_dimension_y * MULT / 2.0;
        vertices->push_back(vtx);
        tex._v[1] = 1.0;
        texcoords->push_back(tex);
    }

    osg::ref_ptr<osg::Vec3Array> normals = new osg::Vec3Array;
    normals->push_back( osg::Vec3(0.0f,0.0f, 1.0f) );

    osg::ref_ptr<osg::Vec4Array> colors = new osg::Vec4Array;
    colors->push_back( osg::Vec4(1.0f, 1.0f, 1.0f, 1.0f) );

    quad = new osg::Geometry;
    quad->setVertexArray( vertices.get() );
    quad->setNormalArray( normals.get() );
    quad->setNormalBinding( osg::Geometry::BIND_OVERALL );
    quad->setColorArray( colors.get() );
    quad->setColorBinding( osg::Geometry::BIND_OVERALL );
    quad->setTexCoordArray( 0, texcoords.get() );
    quad->addPrimitiveSet( new osg::DrawArrays(GL_TRIANGLE_STRIP, 0, vertices->size()) );

    quad->setDataVariance(osg::Object::DYNAMIC);

    osg::ref_ptr<osg::Texture2D> texture = new osg::Texture2D;
    osg::ref_ptr<osg::Image> image = osgDB::readImageFile(shadowTextureName);
    texture->setImage( image.get() );

    osg::ref_ptr<osg::BlendFunc> blendFunc = new osg::BlendFunc;
    blendFunc->setFunction( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );

    osg::ref_ptr<osg::Geode> root = new osg::Geode;
    root->addDrawable( quad.get() );

    osg::StateSet* stateset = root->getOrCreateStateSet();
    stateset->setRenderBinDetails( 2, "DepthSortedBin");
    stateset->setTextureAttributeAndModes(0, texture.get() );
    stateset->setAttributeAndModes( blendFunc );
    stateset->setRenderingHint(osg::StateSet::TRANSPARENT_BIN );

    shadowVertices = vertices;

    //  GfOut("\n################## LOADED SHADOW ###############################\n");
    return root.get();
}*/

void SDCar::deactivateCar(tCarElt *car)
{
    if(this->car == car)
    {
        this->car_root->setNodeMask(0);
    }
}

void SDCar::activateCar(tCarElt *car)
{
    if(this->car == car)
    {
        this->car_root->setNodeMask(1);
    }
}

void SDCar::updateCar()
{
    osg::Vec3 p;

    p[0] = car->_pos_X;//+ car->_drvPos_x;
    p[1] = car->_pos_Y;//+car->_drvPos_y;
    p[2] = car->_pos_Z;//+car->_drvPos_z;

    osg::Matrix mat(car->_posMat[0][0],car->_posMat[0][1],car->_posMat[0][2],car->_posMat[0][3],
            car->_posMat[1][0],car->_posMat[1][1],car->_posMat[1][2],car->_posMat[1][3],
            car->_posMat[2][0],car->_posMat[2][1],car->_posMat[2][2],car->_posMat[2][3],
            car->_posMat[3][0],car->_posMat[3][1],car->_posMat[3][2],car->_posMat[3][3]);

    wheels.updateWheels();

    this->car_branch->setMatrix(mat);

	if(_carShader == 2)
		reflectionMapping->update();

    this->setReflectionMap(reflectionMapping->getReflectionMap());

    //ugly computation,
    /*if (SHADOW_TECHNIQUE == 0)
    {
        osg::ref_ptr<osg::Vec3Array> vertices = new osg::Vec3Array;
        for(unsigned int i=0;i<shadowVertices->size();i++)
        {
            osg::Vec3 vtx = (*shadowVertices.get())[i];
            osg::Vec4 vtx_world = osg::Vec4(vtx,1.0f)*mat;
            vtx_world._v[2] = RtTrackHeightG(car->_trkPos.seg, vtx_world.x(), vtx_world.y()); //0.01 needed, we have to sort out why
            vertices->push_back(osg::Vec3(vtx_world.x(), vtx_world.y(), vtx_world.z()));
        }
        quad->setVertexArray(vertices);
    }*/
}

void SDCar::updateShadingParameters(osg::Matrixf modelview)
{
    shader->update(modelview);
}

void SDCar::setReflectionMap(osg::ref_ptr<osg::Texture> map)
{
    car_branch->getOrCreateStateSet()->setTextureAttributeAndModes(2, map, 
		osg::StateAttribute::ON | osg::StateAttribute::OVERRIDE);
}

SDCars::SDCars(void) :
	cars_branch(NULL)
{

}

SDCars::~SDCars(void)
{
    for(unsigned i=0;i<the_cars.size();i++)
    {
        delete the_cars[i];
    }
}

void SDCars::addSDCar(SDCar *car)
{
    the_cars.insert(the_cars.end(), car);
}

void SDCars::loadCars(tSituation *pSituation, bool trackType, bool subCat)
{
	cars_branch = new osg::Group;
    SDRender *rend = (SDRender *)getRender();
    unsigned carShader = rend->getShader();
    tSituation *s = pSituation;
    this->situation = pSituation;

    for (int i = 0; i < s->_ncars; i++)
    {
        tCarElt* elt = s->cars[i];
        SDCar * car = new SDCar;
        this->addSDCar(car);
        this->cars_branch->addChild(car->loadCar(elt, trackType, subCat, carShader));
    }
    
    return;;
}

void SDCars::deactivateCar(tCarElt *car)
{
    std::vector<SDCar *>::iterator it;
    for(it = the_cars.begin(); it!= the_cars.end(); it++)
    {
        (*it)->deactivateCar(car);
    }
}

void SDCars::activateCar(tCarElt *car)
{
    std::vector<SDCar *>::iterator it;

    for(it = the_cars.begin(); it!= the_cars.end(); it++)
    {
        (*it)->activateCar(car);
    }
}

SDCar *SDCars::getCar(tCarElt *car)
{
    std::vector<SDCar *>::iterator it;
    SDCar *res = new SDCar;

    for(it = the_cars.begin(); it!= the_cars.end(); it++)
    {
        if((*it)->isCar(car))
        {
            res = *it;
        }
    }

    return res;
}

void SDCars::updateCars()
{
    std::vector<SDCar *>::iterator it;

    for(it = the_cars.begin(); it!= the_cars.end(); it++)
    {
        (*it)->updateCar();
    }
}

void SDCars::updateShadingParameters(osg::Matrixf modelview)
{
    std::vector<SDCar *>::iterator it;

    for(it = the_cars.begin(); it!= the_cars.end(); it++)
    {
        (*it)->updateShadingParameters(modelview);
    }
}

void SDCars::unLoad()
{
    cars_branch->removeChildren(0, cars_branch->getNumChildren());
    cars_branch = NULL;
}
