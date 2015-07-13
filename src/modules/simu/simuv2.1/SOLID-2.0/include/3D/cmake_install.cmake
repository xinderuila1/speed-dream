# Install script for directory: /home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/speed-dreams-2/3D" TYPE FILE FILES
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D/Basic.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D/Matrix.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D/Point.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D/Quaternion.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D/Tuple3.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D/Tuple4.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/modules/simu/simuv2.1/SOLID-2.0/include/3D/Vector.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

