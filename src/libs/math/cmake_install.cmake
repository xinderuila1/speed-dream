# Install script for directory: /home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/speed-dreams-2/tmath" TYPE FILE FILES
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/constants.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/linalg_t.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/straight2_t.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/v2_t.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/v3_t.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/v4_t.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/point3d.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGCMath.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGGeoc.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGGeod.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/sg_geodesy.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGGeodesy.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGLimits.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGMath.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGMathFwd.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGMatrix.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGMisc.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGQuat.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/sg_random.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/sg_types.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGVec3.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/SGVec4.h"
    "/home/gaoyu/桌面/speed-dreams-code-6039-trunk/src/libs/math/vector.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

