# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/lab/BinaryStar

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lab/BinaryStar/build

# Include any dependencies generated for this target.
include glfw/tests/CMakeFiles/title.dir/depend.make

# Include the progress variables for this target.
include glfw/tests/CMakeFiles/title.dir/progress.make

# Include the compile flags for this target's objects.
include glfw/tests/CMakeFiles/title.dir/flags.make

glfw/tests/CMakeFiles/title.dir/title.c.o: glfw/tests/CMakeFiles/title.dir/flags.make
glfw/tests/CMakeFiles/title.dir/title.c.o: ../glfw/tests/title.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object glfw/tests/CMakeFiles/title.dir/title.c.o"
	cd /home/lab/BinaryStar/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/title.dir/title.c.o   -c /home/lab/BinaryStar/glfw/tests/title.c

glfw/tests/CMakeFiles/title.dir/title.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/title.dir/title.c.i"
	cd /home/lab/BinaryStar/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lab/BinaryStar/glfw/tests/title.c > CMakeFiles/title.dir/title.c.i

glfw/tests/CMakeFiles/title.dir/title.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/title.dir/title.c.s"
	cd /home/lab/BinaryStar/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lab/BinaryStar/glfw/tests/title.c -o CMakeFiles/title.dir/title.c.s

glfw/tests/CMakeFiles/title.dir/__/deps/glad_gl.c.o: glfw/tests/CMakeFiles/title.dir/flags.make
glfw/tests/CMakeFiles/title.dir/__/deps/glad_gl.c.o: ../glfw/deps/glad_gl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object glfw/tests/CMakeFiles/title.dir/__/deps/glad_gl.c.o"
	cd /home/lab/BinaryStar/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/title.dir/__/deps/glad_gl.c.o   -c /home/lab/BinaryStar/glfw/deps/glad_gl.c

glfw/tests/CMakeFiles/title.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/title.dir/__/deps/glad_gl.c.i"
	cd /home/lab/BinaryStar/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lab/BinaryStar/glfw/deps/glad_gl.c > CMakeFiles/title.dir/__/deps/glad_gl.c.i

glfw/tests/CMakeFiles/title.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/title.dir/__/deps/glad_gl.c.s"
	cd /home/lab/BinaryStar/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lab/BinaryStar/glfw/deps/glad_gl.c -o CMakeFiles/title.dir/__/deps/glad_gl.c.s

# Object files for target title
title_OBJECTS = \
"CMakeFiles/title.dir/title.c.o" \
"CMakeFiles/title.dir/__/deps/glad_gl.c.o"

# External object files for target title
title_EXTERNAL_OBJECTS =

glfw/tests/title: glfw/tests/CMakeFiles/title.dir/title.c.o
glfw/tests/title: glfw/tests/CMakeFiles/title.dir/__/deps/glad_gl.c.o
glfw/tests/title: glfw/tests/CMakeFiles/title.dir/build.make
glfw/tests/title: glfw/src/libglfw3.a
glfw/tests/title: /usr/lib/x86_64-linux-gnu/libm.so
glfw/tests/title: /usr/lib/x86_64-linux-gnu/librt.so
glfw/tests/title: /usr/lib/x86_64-linux-gnu/libm.so
glfw/tests/title: /usr/lib/x86_64-linux-gnu/libX11.so
glfw/tests/title: glfw/tests/CMakeFiles/title.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable title"
	cd /home/lab/BinaryStar/build/glfw/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/title.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
glfw/tests/CMakeFiles/title.dir/build: glfw/tests/title

.PHONY : glfw/tests/CMakeFiles/title.dir/build

glfw/tests/CMakeFiles/title.dir/clean:
	cd /home/lab/BinaryStar/build/glfw/tests && $(CMAKE_COMMAND) -P CMakeFiles/title.dir/cmake_clean.cmake
.PHONY : glfw/tests/CMakeFiles/title.dir/clean

glfw/tests/CMakeFiles/title.dir/depend:
	cd /home/lab/BinaryStar/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lab/BinaryStar /home/lab/BinaryStar/glfw/tests /home/lab/BinaryStar/build /home/lab/BinaryStar/build/glfw/tests /home/lab/BinaryStar/build/glfw/tests/CMakeFiles/title.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : glfw/tests/CMakeFiles/title.dir/depend

