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
include src/libs/tgfdata/CMakeFiles/tgfdata.dir/depend.make

# Include the progress variables for this target.
include src/libs/tgfdata/CMakeFiles/tgfdata.dir/progress.make

# Include the compile flags for this target's objects.
include src/libs/tgfdata/CMakeFiles/tgfdata.dir/flags.make

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o: src/libs/tgfdata/CMakeFiles/tgfdata.dir/flags.make
src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o: src/libs/tgfdata/tgfdata.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tgfdata.dir/tgfdata.cpp.o -c /home/gaoyu/speed-dream/src/libs/tgfdata/tgfdata.cpp

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgfdata.dir/tgfdata.cpp.i"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/libs/tgfdata/tgfdata.cpp > CMakeFiles/tgfdata.dir/tgfdata.cpp.i

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgfdata.dir/tgfdata.cpp.s"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/libs/tgfdata/tgfdata.cpp -o CMakeFiles/tgfdata.dir/tgfdata.cpp.s

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.requires:
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.requires

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.provides: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.requires
	$(MAKE) -f src/libs/tgfdata/CMakeFiles/tgfdata.dir/build.make src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.provides.build
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.provides

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.provides.build: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o

src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o: src/libs/tgfdata/CMakeFiles/tgfdata.dir/flags.make
src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o: src/libs/tgfdata/cars.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tgfdata.dir/cars.cpp.o -c /home/gaoyu/speed-dream/src/libs/tgfdata/cars.cpp

src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgfdata.dir/cars.cpp.i"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/libs/tgfdata/cars.cpp > CMakeFiles/tgfdata.dir/cars.cpp.i

src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgfdata.dir/cars.cpp.s"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/libs/tgfdata/cars.cpp -o CMakeFiles/tgfdata.dir/cars.cpp.s

src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.requires:
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.requires

src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.provides: src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.requires
	$(MAKE) -f src/libs/tgfdata/CMakeFiles/tgfdata.dir/build.make src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.provides.build
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.provides

src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.provides.build: src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o: src/libs/tgfdata/CMakeFiles/tgfdata.dir/flags.make
src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o: src/libs/tgfdata/tracks.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tgfdata.dir/tracks.cpp.o -c /home/gaoyu/speed-dream/src/libs/tgfdata/tracks.cpp

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgfdata.dir/tracks.cpp.i"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/libs/tgfdata/tracks.cpp > CMakeFiles/tgfdata.dir/tracks.cpp.i

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgfdata.dir/tracks.cpp.s"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/libs/tgfdata/tracks.cpp -o CMakeFiles/tgfdata.dir/tracks.cpp.s

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.requires:
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.requires

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.provides: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.requires
	$(MAKE) -f src/libs/tgfdata/CMakeFiles/tgfdata.dir/build.make src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.provides.build
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.provides

src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.provides.build: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o

src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o: src/libs/tgfdata/CMakeFiles/tgfdata.dir/flags.make
src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o: src/libs/tgfdata/racemanagers.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tgfdata.dir/racemanagers.cpp.o -c /home/gaoyu/speed-dream/src/libs/tgfdata/racemanagers.cpp

src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgfdata.dir/racemanagers.cpp.i"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/libs/tgfdata/racemanagers.cpp > CMakeFiles/tgfdata.dir/racemanagers.cpp.i

src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgfdata.dir/racemanagers.cpp.s"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/libs/tgfdata/racemanagers.cpp -o CMakeFiles/tgfdata.dir/racemanagers.cpp.s

src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.requires:
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.requires

src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.provides: src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.requires
	$(MAKE) -f src/libs/tgfdata/CMakeFiles/tgfdata.dir/build.make src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.provides.build
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.provides

src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.provides.build: src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o

src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o: src/libs/tgfdata/CMakeFiles/tgfdata.dir/flags.make
src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o: src/libs/tgfdata/race.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tgfdata.dir/race.cpp.o -c /home/gaoyu/speed-dream/src/libs/tgfdata/race.cpp

src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgfdata.dir/race.cpp.i"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/libs/tgfdata/race.cpp > CMakeFiles/tgfdata.dir/race.cpp.i

src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgfdata.dir/race.cpp.s"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/libs/tgfdata/race.cpp -o CMakeFiles/tgfdata.dir/race.cpp.s

src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.requires:
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.requires

src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.provides: src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.requires
	$(MAKE) -f src/libs/tgfdata/CMakeFiles/tgfdata.dir/build.make src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.provides.build
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.provides

src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.provides.build: src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o

src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o: src/libs/tgfdata/CMakeFiles/tgfdata.dir/flags.make
src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o: src/libs/tgfdata/drivers.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tgfdata.dir/drivers.cpp.o -c /home/gaoyu/speed-dream/src/libs/tgfdata/drivers.cpp

src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgfdata.dir/drivers.cpp.i"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/libs/tgfdata/drivers.cpp > CMakeFiles/tgfdata.dir/drivers.cpp.i

src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgfdata.dir/drivers.cpp.s"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/libs/tgfdata/drivers.cpp -o CMakeFiles/tgfdata.dir/drivers.cpp.s

src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.requires:
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.requires

src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.provides: src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.requires
	$(MAKE) -f src/libs/tgfdata/CMakeFiles/tgfdata.dir/build.make src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.provides.build
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.provides

src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.provides.build: src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o

# Object files for target tgfdata
tgfdata_OBJECTS = \
"CMakeFiles/tgfdata.dir/tgfdata.cpp.o" \
"CMakeFiles/tgfdata.dir/cars.cpp.o" \
"CMakeFiles/tgfdata.dir/tracks.cpp.o" \
"CMakeFiles/tgfdata.dir/racemanagers.cpp.o" \
"CMakeFiles/tgfdata.dir/race.cpp.o" \
"CMakeFiles/tgfdata.dir/drivers.cpp.o"

# External object files for target tgfdata
tgfdata_EXTERNAL_OBJECTS =

lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o
lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o
lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o
lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o
lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o
lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o
lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/build.make
lib64/games/speed-dreams-2/lib/libtgfdata.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: /usr/lib/libplibsg.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: /usr/lib/libplibul.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: /usr/lib/x86_64-linux-gnu/libdl.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: /usr/lib/x86_64-linux-gnu/libSDLmain.a
lib64/games/speed-dreams-2/lib/libtgfdata.so: /usr/lib/x86_64-linux-gnu/libSDL.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: /usr/lib/x86_64-linux-gnu/libexpat.so
lib64/games/speed-dreams-2/lib/libtgfdata.so: src/libs/tgfdata/CMakeFiles/tgfdata.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../../lib64/games/speed-dreams-2/lib/libtgfdata.so"
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tgfdata.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libs/tgfdata/CMakeFiles/tgfdata.dir/build: lib64/games/speed-dreams-2/lib/libtgfdata.so
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/build

src/libs/tgfdata/CMakeFiles/tgfdata.dir/requires: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tgfdata.cpp.o.requires
src/libs/tgfdata/CMakeFiles/tgfdata.dir/requires: src/libs/tgfdata/CMakeFiles/tgfdata.dir/cars.cpp.o.requires
src/libs/tgfdata/CMakeFiles/tgfdata.dir/requires: src/libs/tgfdata/CMakeFiles/tgfdata.dir/tracks.cpp.o.requires
src/libs/tgfdata/CMakeFiles/tgfdata.dir/requires: src/libs/tgfdata/CMakeFiles/tgfdata.dir/racemanagers.cpp.o.requires
src/libs/tgfdata/CMakeFiles/tgfdata.dir/requires: src/libs/tgfdata/CMakeFiles/tgfdata.dir/race.cpp.o.requires
src/libs/tgfdata/CMakeFiles/tgfdata.dir/requires: src/libs/tgfdata/CMakeFiles/tgfdata.dir/drivers.cpp.o.requires
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/requires

src/libs/tgfdata/CMakeFiles/tgfdata.dir/clean:
	cd /home/gaoyu/speed-dream/src/libs/tgfdata && $(CMAKE_COMMAND) -P CMakeFiles/tgfdata.dir/cmake_clean.cmake
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/clean

src/libs/tgfdata/CMakeFiles/tgfdata.dir/depend:
	cd /home/gaoyu/speed-dream && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/libs/tgfdata /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/libs/tgfdata /home/gaoyu/speed-dream/src/libs/tgfdata/CMakeFiles/tgfdata.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libs/tgfdata/CMakeFiles/tgfdata.dir/depend

