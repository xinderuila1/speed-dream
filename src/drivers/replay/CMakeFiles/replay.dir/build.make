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
include src/drivers/replay/CMakeFiles/replay.dir/depend.make

# Include the progress variables for this target.
include src/drivers/replay/CMakeFiles/replay.dir/progress.make

# Include the compile flags for this target's objects.
include src/drivers/replay/CMakeFiles/replay.dir/flags.make

src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o: src/drivers/replay/CMakeFiles/replay.dir/flags.make
src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o: src/drivers/replay/replay.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/replay && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/replay.dir/replay.cpp.o -c /home/gaoyu/speed-dream/src/drivers/replay/replay.cpp

src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/replay.dir/replay.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/replay && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/replay/replay.cpp > CMakeFiles/replay.dir/replay.cpp.i

src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/replay.dir/replay.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/replay && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/replay/replay.cpp -o CMakeFiles/replay.dir/replay.cpp.s

src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.requires:
.PHONY : src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.requires

src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.provides: src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.requires
	$(MAKE) -f src/drivers/replay/CMakeFiles/replay.dir/build.make src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.provides.build
.PHONY : src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.provides

src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.provides.build: src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o

# Object files for target replay
replay_OBJECTS = \
"CMakeFiles/replay.dir/replay.cpp.o"

# External object files for target replay
replay_EXTERNAL_OBJECTS =

lib64/games/speed-dreams-2/drivers/replay/replay.so: src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o
lib64/games/speed-dreams-2/drivers/replay/replay.so: src/drivers/replay/CMakeFiles/replay.dir/build.make
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/libplibsg.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: lib64/games/speed-dreams-2/lib/librobottools.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: lib64/games/speed-dreams-2/lib/libtgfclient.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: lib64/games/speed-dreams-2/lib/libnetworking.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libdl.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libexpat.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libenet.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/libplibsl.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libpng.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libz.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libGLU.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libGL.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libSM.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libICE.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libX11.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libXext.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libopenal.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/libplibjs.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/libplibsl.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libpng.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libz.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libGLU.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libGL.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libSM.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libICE.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libX11.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libXext.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libopenal.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/libplibjs.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/libplibsg.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/libplibul.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libSDLmain.a
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libSDL.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: /usr/lib/x86_64-linux-gnu/libXrandr.so
lib64/games/speed-dreams-2/drivers/replay/replay.so: src/drivers/replay/CMakeFiles/replay.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../../lib64/games/speed-dreams-2/drivers/replay/replay.so"
	cd /home/gaoyu/speed-dream/src/drivers/replay && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/replay.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/drivers/replay/CMakeFiles/replay.dir/build: lib64/games/speed-dreams-2/drivers/replay/replay.so
.PHONY : src/drivers/replay/CMakeFiles/replay.dir/build

src/drivers/replay/CMakeFiles/replay.dir/requires: src/drivers/replay/CMakeFiles/replay.dir/replay.cpp.o.requires
.PHONY : src/drivers/replay/CMakeFiles/replay.dir/requires

src/drivers/replay/CMakeFiles/replay.dir/clean:
	cd /home/gaoyu/speed-dream/src/drivers/replay && $(CMAKE_COMMAND) -P CMakeFiles/replay.dir/cmake_clean.cmake
.PHONY : src/drivers/replay/CMakeFiles/replay.dir/clean

src/drivers/replay/CMakeFiles/replay.dir/depend:
	cd /home/gaoyu/speed-dream && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/drivers/replay /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/drivers/replay /home/gaoyu/speed-dream/src/drivers/replay/CMakeFiles/replay.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/drivers/replay/CMakeFiles/replay.dir/depend

