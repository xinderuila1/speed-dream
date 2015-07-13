# Install script for directory: /home/gaoyu/speed-dream/src/interfaces

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/speed-dreams-2" TYPE FILE FILES
    "/home/gaoyu/speed-dream/src/interfaces/car.h"
    "/home/gaoyu/speed-dream/src/interfaces/graphic.h"
    "/home/gaoyu/speed-dream/src/interfaces/playerpref.h"
    "/home/gaoyu/speed-dream/src/interfaces/raceman.h"
    "/home/gaoyu/speed-dream/src/interfaces/replay.h"
    "/home/gaoyu/speed-dream/src/interfaces/robot.h"
    "/home/gaoyu/speed-dream/src/interfaces/telemetry.h"
    "/home/gaoyu/speed-dream/src/interfaces/track.h"
    "/home/gaoyu/speed-dream/src/interfaces/iraceengine.h"
    "/home/gaoyu/speed-dream/src/interfaces/iuserinterface.h"
    "/home/gaoyu/speed-dream/src/interfaces/igraphicsengine.h"
    "/home/gaoyu/speed-dream/src/interfaces/iphysicsengine.h"
    "/home/gaoyu/speed-dream/src/interfaces/itrackloader.h"
    "/home/gaoyu/speed-dream/src/interfaces/isoundengine.h"
    "/home/gaoyu/speed-dream/src/interfaces/camera.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

