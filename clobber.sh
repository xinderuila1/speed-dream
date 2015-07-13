#!/bin/sh
# CMake-generated script for in-source build tree total cleanup
# (remove any build-system-generated file (+ .bak, *~, ... etc), 
#  in case you want to get back to something like
#  right after a 'svn checkout' command).

# Check if we are on top of a CMake-enabled SD source tree
if [ -f CMakeLists.txt -a -d cmake -a -d data -a -d src ] ; then

  echo "Cleaning up in-source build tree ..."
  
  # CMake/compiler generated files and dirs
  rm -f CMakeCache.txt CMakeLists.txt.user config.h doxygen_config
  rm -f CPackConfig.cmake CPackSourceConfig.cmake
  rm -f uninstall.cmake
  rm -f xmlversion_loc.txt install_manifest.txt version.h.txt
  rm -fr _CPack_Packages
  find . -depth -type d -name "CMakeFiles" -exec rm -fr {} \;
  find . -type f -name "cmake_install.cmake" -delete
  find . -type f -name "Makefile" -delete
  find . -type f -name "*.so" -delete
  find src/tools -type f -name "sd2-*" -delete
  find src/tools/xmlversion -type f -name "xmlversion" -delete
  find src/main -type f -name "speed-dreams-2" -delete

  # Other useless files
  find . -type f -name "*.rej" -delete
  find . -type f -name "*.orig" -delete
  find . -type f -name "*.flc" -delete
  find . -type f -name "*.bak" -delete
  find . -type f -name "*.cbp" -delete
  find . -type f -name "*.a" -delete
  find . -type f -name "*~" -delete
  find . -type f -name "*.~*" -delete
  
  echo "Done."
  
else
  echo "Bad current dir for that ; please run from the root folder of a CMake-enabled SD source tree."
fi
