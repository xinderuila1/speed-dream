/***************************************************************************

    file        : OsgScreens.cpp
    created     : Sun Jan 13 22:11:03 CEST 2013
    copyright   : (C) 2013 by Xavier Bertaux
    email       : bertauxx@yahoo.fr
    version     : $Id$

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include <tgfclient.h>

#include <osgViewer/Viewer>
#include <osgViewer/GraphicsWindow>
#include <osg/GraphicsContext>
#include <osg/ValueObject>
#include <osg/FrontFace>

#include "OsgScreens.h"
#include "OsgDebugHUD.h"
#include "OsgReflectionMapping.h"
#include "OsgMain.h"
#include "OsgCar.h"

SDScreens::SDScreens() :
    root(NULL),
    mirrorScene(NULL),
    prerenderRoot(NULL),

    m_CurrentScreenIndex(0)
{
    debugHUD = new SDDebugHUD();
    //viewer = static_cast<osgViewer::Viewer *> (GfScrGetViewer());
    viewer = new osgViewer::Viewer;
    viewer->setSceneData(new osg::Group());
}

class CameraDrawnCallback : public osg::Camera::DrawCallback
{
public:
    virtual void operator()(const osg::Camera& cam) const
    {
        SDCars * cars = (SDCars*)getCars();
        osg::Matrixf mat = cam.getViewMatrix();
        cars->updateShadingParameters(mat);
    }
};


void SDScreens::Init(int x,int y, int width, int height, osg::ref_ptr<osg::Node> m_sceneroot, osg::Vec3f fogcolor)
{
    //intialising main screen

    viewer = new osgViewer::Viewer;
    //viewer->setThreadingModel(osgViewer::Viewer::CullThreadPerCameraDrawThreadPerContext);
    //SDView * view = new SDView(viewer->getCamera(),0,0, m_Winw, m_Winh, mirrorCam.get());
    //osg::ref_ptr<osgViewer::GraphicsWindowEmbedded> gw = viewer->setUpViewerAsEmbeddedInWindow(0, 0, m_Winw, m_Winh);
    //viewer->getCamera()->setViewport(new osg::Viewport(0, 0, m_Winw, m_Winh));
    //viewer->getCamera()->setGraphicsContext(gw);
    osg::ref_ptr<osgViewer::GraphicsWindowEmbedded> gw = viewer->setUpViewerAsEmbeddedInWindow(0, 0, width, height);
    viewer->getCamera()->setComputeNearFarMode(osg::CullSettings::DO_NOT_COMPUTE_NEAR_FAR);
    viewer->getCamera()->setPreDrawCallback(new CameraDrawnCallback);
    //viewer->realize();

    osg::ref_ptr<osg::Camera> mirrorCam = new osg::Camera;
    mirrorCam->setGraphicsContext(gw);
    mirrorCam->setClearMask( GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
    mirrorCam->setReferenceFrame( osg::Camera::ABSOLUTE_RF );

    //Screens.insert(Screens.end(), view);

    SDView * view = new SDView(viewer->getCamera(),0,0, width, height, mirrorCam.get());
    Screens.push_back(view);

    /* Set the scene graph root node for traversal by the viewer */
    root = new osg::Group;
    viewer->setSceneData(root.get());
    mirrorScene = new osg::Group;
#if 1
    prerenderRoot = new osg::Group;
    root->addChild(prerenderRoot);
    //root->addChild(reflectionMapping->getCamerasRoot());
#endif
    root->addChild(m_sceneroot.get());
    root->addChild(mirrorCam);
    mirrorScene->addChild(m_sceneroot.get());
    mirrorCam->addChild(mirrorScene.get());

    osg::FrontFace *frontFace = new osg::FrontFace();
    frontFace->setMode( osg::FrontFace::CLOCKWISE );
    osg::StateSet *mirrorStateSet = mirrorScene.get()->getOrCreateStateSet();
    mirrorStateSet->setAttribute(frontFace);
    mirrorStateSet->setMode( GL_CULL_FACE, osg::StateAttribute::ON );

    //debugHUD->setTexture(reflectionMapping->getMap());
    // debugHUD->setTexture(reflectionMapping->getReflectionMap());
    root->addChild(debugHUD->getRootCamera());

    //viewer->setSceneData(root.get());
    viewer->realize();
}

void SDScreens::InitCars(tSituation *s)
{
    int		i;
    tCarElt 	*elt;

    const char *pszSpanSplit;
    int grNbSuggestedScreens = 0;

    for (i = 0; i < s->_ncars; i++)
    {
        elt = s->cars[i];

        //  Pre-assign each human driver (if any) to a different screen
        // (set him as the "current driver" for this screen).
        if (grNbSuggestedScreens < SD_NB_MAX_SCREEN
                && elt->_driverType == RM_DRV_HUMAN && !elt->_networkPlayer)
        {
            Screens[0]->setCurrentCar(elt);
            GfLogTrace("Screen #%d : Assigned to %s\n", 0, elt->_name);
            grNbSuggestedScreens++;
        }
    }

    /* Check whether view should be spanned across vertical splits */
    pszSpanSplit = GfParmGetStr(grHandle, GR_SCT_GRAPHIC, GR_ATT_SPANSPLIT, GR_VAL_NO);
    m_SpanSplit = strcmp(pszSpanSplit, GR_VAL_YES) ? 0 : 1;

    if (m_SpanSplit == 0 && grNbSuggestedScreens > 1)
    {
        // Mulitplayer, so ignore the stored number of screens
        m_NbActiveScreens = grNbSuggestedScreens;
        m_NbArrangeScreens = 0;
    } else
    {
        // Load the real number of active screens and the arrangment.
        m_NbActiveScreens = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_NB_SCREENS, NULL, 1.0);
        m_NbArrangeScreens = (int)GfParmGetNum(grHandle, GR_SCT_DISPMODE, GR_ATT_ARR_SCREENS, NULL, 0.0);
    }

    // Initialize the cameras for all the screens.
    for (unsigned i=0; i<Screens.size();i++)
    {
        Screens[i]->Init(s);
    }
}

void SDScreens::update(tSituation * s,SDFrameInfo* fi)
{
    for (unsigned i=0;i< Screens.size();i++)
    {
        Screens[i]->update(s,fi);
    }


    SDCars * cars = (SDCars *)getCars();
    tCarElt * c = this->getActiveView()->getCurrentCar();
    this->debugHUD->setTexture(cars->getCar(c)->getReflectionMap()->getReflectionMap());

    if (!viewer->done())
        viewer->frame();
}

void SDScreens::changeCamera(long p)
{
    this->getActiveView()->getCameras()->nextCamera(p);

    // For SpanSplit ensure screens change together
    if (m_SpanSplit && getActiveView()->getViewOffset() )
    {
        int i, camList,camNum;

        getActiveView()->getCameras()->getIntSelectedListAndCamera(&camList,&camNum);

        for (i=0; i < m_NbActiveScreens; i++)
            if (Screens[i]->getViewOffset() )
                Screens[i]->getCameras()->selectCamera(camList,camNum);
    }
}

void SDScreens::toggleDebugHUD()
{
    debugHUD->toggleHUD();
}

void SDScreens::registerViewDependantPreRenderNode(osg::ref_ptr<osg::Node> node)
{
    //TODO : multi-screen support of this feature
    prerenderRoot->addChild(node);
}


SDScreens::~SDScreens()
{
    root->removeChildren(0, root->getNumChildren());
    root = NULL;

    for (unsigned i=0;i< Screens.size();i++)
    {
        delete Screens[i];
    }

    viewer->setSceneData(new osg::Group());


    delete viewer;
    delete debugHUD;
    viewer = NULL;
}
