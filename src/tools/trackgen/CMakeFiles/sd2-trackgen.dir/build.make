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
include src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/depend.make

# Include the progress variables for this target.
include src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/progress.make

# Include the compile flags for this target's objects.
include src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o: src/tools/trackgen/ac3d.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/ac3d.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/ac3d.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/ac3d.cpp > CMakeFiles/sd2-trackgen.dir/ac3d.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/ac3d.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/ac3d.cpp -o CMakeFiles/sd2-trackgen.dir/ac3d.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o: src/tools/trackgen/easymesh.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/easymesh.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/easymesh.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/easymesh.cpp > CMakeFiles/sd2-trackgen.dir/easymesh.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/easymesh.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/easymesh.cpp -o CMakeFiles/sd2-trackgen.dir/easymesh.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o: src/tools/trackgen/elevation.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/elevation.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/elevation.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/elevation.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/elevation.cpp > CMakeFiles/sd2-trackgen.dir/elevation.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/elevation.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/elevation.cpp -o CMakeFiles/sd2-trackgen.dir/elevation.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o: src/tools/trackgen/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/main.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/main.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/main.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/main.cpp > CMakeFiles/sd2-trackgen.dir/main.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/main.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/main.cpp -o CMakeFiles/sd2-trackgen.dir/main.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o: src/tools/trackgen/objects.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/objects.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/objects.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/objects.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/objects.cpp > CMakeFiles/sd2-trackgen.dir/objects.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/objects.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/objects.cpp -o CMakeFiles/sd2-trackgen.dir/objects.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o: src/tools/trackgen/relief.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/relief.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/relief.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/relief.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/relief.cpp > CMakeFiles/sd2-trackgen.dir/relief.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/relief.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/relief.cpp -o CMakeFiles/sd2-trackgen.dir/relief.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o: src/tools/trackgen/track.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/track.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/track.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/track.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/track.cpp > CMakeFiles/sd2-trackgen.dir/track.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/track.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/track.cpp -o CMakeFiles/sd2-trackgen.dir/track.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/flags.make
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o: src/tools/trackgen/util.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sd2-trackgen.dir/util.cpp.o -c /home/gaoyu/speed-dream/src/tools/trackgen/util.cpp

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sd2-trackgen.dir/util.cpp.i"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/tools/trackgen/util.cpp > CMakeFiles/sd2-trackgen.dir/util.cpp.i

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sd2-trackgen.dir/util.cpp.s"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/tools/trackgen/util.cpp -o CMakeFiles/sd2-trackgen.dir/util.cpp.s

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.requires:
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.provides: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.requires
	$(MAKE) -f src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.provides.build
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.provides

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.provides.build: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o

# Object files for target sd2-trackgen
sd2__trackgen_OBJECTS = \
"CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o" \
"CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o" \
"CMakeFiles/sd2-trackgen.dir/elevation.cpp.o" \
"CMakeFiles/sd2-trackgen.dir/main.cpp.o" \
"CMakeFiles/sd2-trackgen.dir/objects.cpp.o" \
"CMakeFiles/sd2-trackgen.dir/relief.cpp.o" \
"CMakeFiles/sd2-trackgen.dir/track.cpp.o" \
"CMakeFiles/sd2-trackgen.dir/util.cpp.o"

# External object files for target sd2-trackgen
sd2__trackgen_EXTERNAL_OBJECTS =

games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build.make
games/sd2-trackgen: lib64/games/speed-dreams-2/lib/libportability.so
games/sd2-trackgen: lib64/games/speed-dreams-2/lib/librobottools.so
games/sd2-trackgen: lib64/games/speed-dreams-2/lib/libtgf.so
games/sd2-trackgen: lib64/games/speed-dreams-2/lib/libtgfclient.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libGLU.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libGL.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libSM.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libICE.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libX11.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libXext.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libpng.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libz.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libSDLmain.a
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libSDLmain.a
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libSDL.so
games/sd2-trackgen: /usr/lib/libplibsg.so
games/sd2-trackgen: /usr/lib/libplibssg.so
games/sd2-trackgen: /usr/lib/libplibul.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libdl.so
games/sd2-trackgen: lib64/games/speed-dreams-2/lib/libnetworking.so
games/sd2-trackgen: lib64/games/speed-dreams-2/lib/libtgf.so
games/sd2-trackgen: lib64/games/speed-dreams-2/lib/libportability.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libexpat.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libenet.so
games/sd2-trackgen: /usr/lib/libplibsl.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libjpeg.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libopenal.so
games/sd2-trackgen: /usr/lib/libplibsl.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libjpeg.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libopenal.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libpng.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libz.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libGLU.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libGL.so
games/sd2-trackgen: /usr/lib/libplibjs.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libSM.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libICE.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libX11.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libXext.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libSDLmain.a
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libSDL.so
games/sd2-trackgen: /usr/lib/libplibsg.so
games/sd2-trackgen: /usr/lib/libplibul.so
games/sd2-trackgen: /usr/lib/x86_64-linux-gnu/libdl.so
games/sd2-trackgen: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../../games/sd2-trackgen"
	cd /home/gaoyu/speed-dream/src/tools/trackgen && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sd2-trackgen.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build: games/sd2-trackgen
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/build

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/ac3d.cpp.o.requires
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/easymesh.cpp.o.requires
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/elevation.cpp.o.requires
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/main.cpp.o.requires
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/objects.cpp.o.requires
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/relief.cpp.o.requires
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/track.cpp.o.requires
src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires: src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/util.cpp.o.requires
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/requires

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/clean:
	cd /home/gaoyu/speed-dream/src/tools/trackgen && $(CMAKE_COMMAND) -P CMakeFiles/sd2-trackgen.dir/cmake_clean.cmake
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/clean

src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/depend:
	cd /home/gaoyu/speed-dream && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/tools/trackgen /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/tools/trackgen /home/gaoyu/speed-dream/src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tools/trackgen/CMakeFiles/sd2-trackgen.dir/depend

