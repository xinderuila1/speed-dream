# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gaoyu/speed-dream

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gaoyu/speed-dream

# Include any dependencies generated for this target.
include src/drivers/human/CMakeFiles/human.dir/depend.make

# Include the progress variables for this target.
include src/drivers/human/CMakeFiles/human.dir/progress.make

# Include the compile flags for this target's objects.
include src/drivers/human/CMakeFiles/human.dir/flags.make

src/drivers/human/CMakeFiles/human.dir/human.cpp.o: src/drivers/human/CMakeFiles/human.dir/flags.make
src/drivers/human/CMakeFiles/human.dir/human.cpp.o: src/drivers/human/human.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/human/CMakeFiles/human.dir/human.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/human && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/human.dir/human.cpp.o -c /home/gaoyu/speed-dream/src/drivers/human/human.cpp

src/drivers/human/CMakeFiles/human.dir/human.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/human.dir/human.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/human && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/human/human.cpp > CMakeFiles/human.dir/human.cpp.i

src/drivers/human/CMakeFiles/human.dir/human.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/human.dir/human.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/human && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/human/human.cpp -o CMakeFiles/human.dir/human.cpp.s

src/drivers/human/CMakeFiles/human.dir/human.cpp.o.requires:
.PHONY : src/drivers/human/CMakeFiles/human.dir/human.cpp.o.requires

src/drivers/human/CMakeFiles/human.dir/human.cpp.o.provides: src/drivers/human/CMakeFiles/human.dir/human.cpp.o.requires
	$(MAKE) -f src/drivers/human/CMakeFiles/human.dir/build.make src/drivers/human/CMakeFiles/human.dir/human.cpp.o.provides.build
.PHONY : src/drivers/human/CMakeFiles/human.dir/human.cpp.o.provides

src/drivers/human/CMakeFiles/human.dir/human.cpp.o.provides.build: src/drivers/human/CMakeFiles/human.dir/human.cpp.o

# Object files for target human
human_OBJECTS = \
"CMakeFiles/human.dir/human.cpp.o"

# External object files for target human
human_EXTERNAL_OBJECTS =

lib64/games/speed-dreams-2/drivers/human/human.so: src/drivers/human/CMakeFiles/human.dir/human.cpp.o
lib64/games/speed-dreams-2/drivers/human/human.so: src/drivers/human/CMakeFiles/human.dir/build.make
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/libplibsg.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/librobottools.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/librobottools.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/librobottools.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libtgfclient.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libnetworking.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/drivers/human/human.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libdl.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libexpat.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libenet.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/libplibsl.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libpng.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libz.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libGLU.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libGL.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libSM.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libICE.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libX11.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libXext.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libopenal.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/libplibjs.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/libplibsl.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libpng.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libz.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libGLU.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libGL.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libSM.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libICE.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libX11.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libXext.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libopenal.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/libplibjs.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/libplibsg.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libSDLmain.a
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libSDL.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/x86_64-linux-gnu/libXrandr.so
lib64/games/speed-dreams-2/drivers/human/human.so: /usr/lib/libplibul.so
lib64/games/speed-dreams-2/drivers/human/human.so: src/drivers/human/CMakeFiles/human.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../../lib64/games/speed-dreams-2/drivers/human/human.so"
	cd /home/gaoyu/speed-dream/src/drivers/human && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/human.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/drivers/human/CMakeFiles/human.dir/build: lib64/games/speed-dreams-2/drivers/human/human.so
.PHONY : src/drivers/human/CMakeFiles/human.dir/build

src/drivers/human/CMakeFiles/human.dir/requires: src/drivers/human/CMakeFiles/human.dir/human.cpp.o.requires
.PHONY : src/drivers/human/CMakeFiles/human.dir/requires

src/drivers/human/CMakeFiles/human.dir/clean:
	cd /home/gaoyu/speed-dream/src/drivers/human && $(CMAKE_COMMAND) -P CMakeFiles/human.dir/cmake_clean.cmake
.PHONY : src/drivers/human/CMakeFiles/human.dir/clean

src/drivers/human/CMakeFiles/human.dir/depend:
	cd /home/gaoyu/speed-dream && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/drivers/human /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/drivers/human /home/gaoyu/speed-dream/src/drivers/human/CMakeFiles/human.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/drivers/human/CMakeFiles/human.dir/depend

