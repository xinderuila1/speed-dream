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
include src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/depend.make

# Include the progress variables for this target.
include src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/progress.make

# Include the compile flags for this target's objects.
include src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/flags.make

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/flags.make
src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o: src/modules/telemetry/telemetryv1/telemetryitf.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o"
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o -c /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1/telemetryitf.cpp

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/telemetryv1.dir/telemetryitf.cpp.i"
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1/telemetryitf.cpp > CMakeFiles/telemetryv1.dir/telemetryitf.cpp.i

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/telemetryv1.dir/telemetryitf.cpp.s"
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1/telemetryitf.cpp -o CMakeFiles/telemetryv1.dir/telemetryitf.cpp.s

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.requires:
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.requires

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.provides: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.requires
	$(MAKE) -f src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/build.make src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.provides.build
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.provides

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.provides.build: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/flags.make
src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o: src/modules/telemetry/telemetryv1/telemetry.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gaoyu/speed-dream/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o"
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/telemetryv1.dir/telemetry.cpp.o -c /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1/telemetry.cpp

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/telemetryv1.dir/telemetry.cpp.i"
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1/telemetry.cpp > CMakeFiles/telemetryv1.dir/telemetry.cpp.i

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/telemetryv1.dir/telemetry.cpp.s"
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1/telemetry.cpp -o CMakeFiles/telemetryv1.dir/telemetry.cpp.s

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.requires:
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.requires

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.provides: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.requires
	$(MAKE) -f src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/build.make src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.provides.build
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.provides

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.provides.build: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o

# Object files for target telemetryv1
telemetryv1_OBJECTS = \
"CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o" \
"CMakeFiles/telemetryv1.dir/telemetry.cpp.o"

# External object files for target telemetryv1
telemetryv1_EXTERNAL_OBJECTS =

lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/build.make
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: lib64/games/speed-dreams-2/lib/libtgf.so
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: lib64/games/speed-dreams-2/lib/libportability.so
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: /usr/lib/x86_64-linux-gnu/libdl.so
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: /usr/lib/x86_64-linux-gnu/libSDLmain.a
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: /usr/lib/x86_64-linux-gnu/libSDL.so
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: /usr/lib/x86_64-linux-gnu/libexpat.so
lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../../../lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so"
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/telemetryv1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/build: lib64/games/speed-dreams-2/modules/telemetry/telemetryv1.so
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/build

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/requires: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetryitf.cpp.o.requires
src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/requires: src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/telemetry.cpp.o.requires
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/requires

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/clean:
	cd /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 && $(CMAKE_COMMAND) -P CMakeFiles/telemetryv1.dir/cmake_clean.cmake
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/clean

src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/depend:
	cd /home/gaoyu/speed-dream && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 /home/gaoyu/speed-dream /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1 /home/gaoyu/speed-dream/src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/modules/telemetry/telemetryv1/CMakeFiles/telemetryv1.dir/depend

