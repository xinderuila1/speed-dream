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
include src/drivers/dandroid/CMakeFiles/dandroid.dir/depend.make

# Include the progress variables for this target.
include src/drivers/dandroid/CMakeFiles/dandroid.dir/progress.make

# Include the compile flags for this target's objects.
include src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o: src/drivers/dandroid/src/ClothoidPath.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/ClothoidPath.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/ClothoidPath.cpp > CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/ClothoidPath.cpp -o CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o: src/drivers/dandroid/src/cubic.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/cubic.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/cubic.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/cubic.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/cubic.cpp > CMakeFiles/dandroid.dir/src/cubic.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/cubic.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/cubic.cpp -o CMakeFiles/dandroid.dir/src/cubic.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o: src/drivers/dandroid/src/dandroid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/dandroid.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/dandroid.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/dandroid.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/dandroid.cpp > CMakeFiles/dandroid.dir/src/dandroid.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/dandroid.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/dandroid.cpp -o CMakeFiles/dandroid.dir/src/dandroid.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o: src/drivers/dandroid/src/danpath.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/danpath.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/danpath.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/danpath.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/danpath.cpp > CMakeFiles/dandroid.dir/src/danpath.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/danpath.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/danpath.cpp -o CMakeFiles/dandroid.dir/src/danpath.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o: src/drivers/dandroid/src/driver.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/driver.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/driver.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/driver.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/driver.cpp > CMakeFiles/dandroid.dir/src/driver.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/driver.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/driver.cpp -o CMakeFiles/dandroid.dir/src/driver.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o: src/drivers/dandroid/src/LinePath.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/LinePath.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/LinePath.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/LinePath.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/LinePath.cpp > CMakeFiles/dandroid.dir/src/LinePath.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/LinePath.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/LinePath.cpp -o CMakeFiles/dandroid.dir/src/LinePath.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o: src/drivers/dandroid/src/MyTrack.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/MyTrack.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/MyTrack.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/MyTrack.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/MyTrack.cpp > CMakeFiles/dandroid.dir/src/MyTrack.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/MyTrack.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/MyTrack.cpp -o CMakeFiles/dandroid.dir/src/MyTrack.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o: src/drivers/dandroid/src/opponent.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/opponent.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/opponent.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/opponent.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/opponent.cpp > CMakeFiles/dandroid.dir/src/opponent.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/opponent.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/opponent.cpp -o CMakeFiles/dandroid.dir/src/opponent.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o: src/drivers/dandroid/src/pidcontroller.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/pidcontroller.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/pidcontroller.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/pidcontroller.cpp > CMakeFiles/dandroid.dir/src/pidcontroller.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/pidcontroller.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/pidcontroller.cpp -o CMakeFiles/dandroid.dir/src/pidcontroller.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o: src/drivers/dandroid/src/pit.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/pit.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/pit.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/pit.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/pit.cpp > CMakeFiles/dandroid.dir/src/pit.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/pit.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/pit.cpp -o CMakeFiles/dandroid.dir/src/pit.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o: src/drivers/dandroid/src/spline.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/spline.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/spline.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/spline.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/spline.cpp > CMakeFiles/dandroid.dir/src/spline.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/spline.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/spline.cpp -o CMakeFiles/dandroid.dir/src/spline.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o: src/drivers/dandroid/CMakeFiles/dandroid.dir/flags.make
src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o: src/drivers/dandroid/src/Utils.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dandroid.dir/src/Utils.cpp.o -c /home/gaoyu/speed-dream/src/drivers/dandroid/src/Utils.cpp

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dandroid.dir/src/Utils.cpp.i"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/drivers/dandroid/src/Utils.cpp > CMakeFiles/dandroid.dir/src/Utils.cpp.i

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dandroid.dir/src/Utils.cpp.s"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/drivers/dandroid/src/Utils.cpp -o CMakeFiles/dandroid.dir/src/Utils.cpp.s

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.requires:
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.provides: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.requires
	$(MAKE) -f src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.provides.build
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.provides

src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.provides.build: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o

# Object files for target dandroid
dandroid_OBJECTS = \
"CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o" \
"CMakeFiles/dandroid.dir/src/cubic.cpp.o" \
"CMakeFiles/dandroid.dir/src/dandroid.cpp.o" \
"CMakeFiles/dandroid.dir/src/danpath.cpp.o" \
"CMakeFiles/dandroid.dir/src/driver.cpp.o" \
"CMakeFiles/dandroid.dir/src/LinePath.cpp.o" \
"CMakeFiles/dandroid.dir/src/MyTrack.cpp.o" \
"CMakeFiles/dandroid.dir/src/opponent.cpp.o" \
"CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o" \
"CMakeFiles/dandroid.dir/src/pit.cpp.o" \
"CMakeFiles/dandroid.dir/src/spline.cpp.o" \
"CMakeFiles/dandroid.dir/src/Utils.cpp.o"

# External object files for target dandroid
dandroid_EXTERNAL_OBJECTS =

lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/build.make
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/libplibsg.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: lib64/games/speed-dreams-2/lib/librobottools.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: lib64/games/speed-dreams-2/lib/libtgfclient.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: lib64/games/speed-dreams-2/lib/libnetworking.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libdl.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libexpat.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libenet.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/libplibsl.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libpng.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libz.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libGLU.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libGL.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libSM.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libICE.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libX11.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libXext.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libopenal.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/libplibjs.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/libplibsl.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libpng.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libz.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libGLU.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libGL.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libSM.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libICE.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libX11.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libXext.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libopenal.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/libplibjs.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/libplibsg.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/libplibul.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libSDLmain.a
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libSDL.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: /usr/lib/x86_64-linux-gnu/libXrandr.so
lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so: src/drivers/dandroid/CMakeFiles/dandroid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../../lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so"
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dandroid.dir/link.txt --verbose=$(VERBOSE)
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/cmake -E echo Creating\ directory\ /home/gaoyu/speed-dream/lib64/games/speed-dreams-2/drivers/dandroid_36GP
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/cmake -E make_directory /home/gaoyu/speed-dream/lib64/games/speed-dreams-2/drivers/dandroid_36GP
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/cmake -E echo Cloning\ dandroid.so=/home/gaoyu/speed-dream/lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so\ into\ /home/gaoyu/speed-dream/lib64/games/speed-dreams-2/drivers/dandroid_36GP/dandroid_36GP.so
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && /usr/bin/cmake -E copy_if_different /home/gaoyu/speed-dream/lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so /home/gaoyu/speed-dream/lib64/games/speed-dreams-2/drivers/dandroid_36GP/dandroid_36GP.so

# Rule to build all files generated by this target.
src/drivers/dandroid/CMakeFiles/dandroid.dir/build: lib64/games/speed-dreams-2/drivers/dandroid/dandroid.so
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/build

src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/ClothoidPath.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/cubic.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/dandroid.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/danpath.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/driver.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/LinePath.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/MyTrack.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/opponent.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pidcontroller.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/pit.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/spline.cpp.o.requires
src/drivers/dandroid/CMakeFiles/dandroid.dir/requires: src/drivers/dandroid/CMakeFiles/dandroid.dir/src/Utils.cpp.o.requires
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/requires

src/drivers/dandroid/CMakeFiles/dandroid.dir/clean:
	cd /home/gaoyu/speed-dream/src/drivers/dandroid && $(CMAKE_COMMAND) -P CMakeFiles/dandroid.dir/cmake_clean.cmake
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/clean

src/drivers/dandroid/CMakeFiles/dandroid.dir/depend:
	cd /home/gaoyu/speed-dream && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/drivers/dandroid /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/drivers/dandroid /home/gaoyu/speed-dream/src/drivers/dandroid/CMakeFiles/dandroid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/drivers/dandroid/CMakeFiles/dandroid.dir/depend

