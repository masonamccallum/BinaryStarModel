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
CMAKE_SOURCE_DIR = /home/lab/BinaryStarModel/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lab/BinaryStarModel/source/build

# Include any dependencies generated for this target.
include glfw/tests/CMakeFiles/opacity.dir/depend.make

# Include the progress variables for this target.
include glfw/tests/CMakeFiles/opacity.dir/progress.make

# Include the compile flags for this target's objects.
include glfw/tests/CMakeFiles/opacity.dir/flags.make

glfw/tests/CMakeFiles/opacity.dir/opacity.c.o: glfw/tests/CMakeFiles/opacity.dir/flags.make
glfw/tests/CMakeFiles/opacity.dir/opacity.c.o: ../glfw/tests/opacity.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStarModel/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object glfw/tests/CMakeFiles/opacity.dir/opacity.c.o"
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/opacity.dir/opacity.c.o   -c /home/lab/BinaryStarModel/source/glfw/tests/opacity.c

glfw/tests/CMakeFiles/opacity.dir/opacity.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opacity.dir/opacity.c.i"
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lab/BinaryStarModel/source/glfw/tests/opacity.c > CMakeFiles/opacity.dir/opacity.c.i

glfw/tests/CMakeFiles/opacity.dir/opacity.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opacity.dir/opacity.c.s"
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lab/BinaryStarModel/source/glfw/tests/opacity.c -o CMakeFiles/opacity.dir/opacity.c.s

glfw/tests/CMakeFiles/opacity.dir/__/deps/glad_gl.c.o: glfw/tests/CMakeFiles/opacity.dir/flags.make
glfw/tests/CMakeFiles/opacity.dir/__/deps/glad_gl.c.o: ../glfw/deps/glad_gl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStarModel/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object glfw/tests/CMakeFiles/opacity.dir/__/deps/glad_gl.c.o"
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/opacity.dir/__/deps/glad_gl.c.o   -c /home/lab/BinaryStarModel/source/glfw/deps/glad_gl.c

glfw/tests/CMakeFiles/opacity.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opacity.dir/__/deps/glad_gl.c.i"
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lab/BinaryStarModel/source/glfw/deps/glad_gl.c > CMakeFiles/opacity.dir/__/deps/glad_gl.c.i

glfw/tests/CMakeFiles/opacity.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opacity.dir/__/deps/glad_gl.c.s"
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lab/BinaryStarModel/source/glfw/deps/glad_gl.c -o CMakeFiles/opacity.dir/__/deps/glad_gl.c.s

# Object files for target opacity
opacity_OBJECTS = \
"CMakeFiles/opacity.dir/opacity.c.o" \
"CMakeFiles/opacity.dir/__/deps/glad_gl.c.o"

# External object files for target opacity
opacity_EXTERNAL_OBJECTS =

glfw/tests/opacity: glfw/tests/CMakeFiles/opacity.dir/opacity.c.o
glfw/tests/opacity: glfw/tests/CMakeFiles/opacity.dir/__/deps/glad_gl.c.o
glfw/tests/opacity: glfw/tests/CMakeFiles/opacity.dir/build.make
glfw/tests/opacity: glfw/src/libglfw3.a
glfw/tests/opacity: /usr/lib/x86_64-linux-gnu/libm.so
glfw/tests/opacity: /usr/lib/x86_64-linux-gnu/librt.so
glfw/tests/opacity: /usr/lib/x86_64-linux-gnu/libm.so
glfw/tests/opacity: /usr/lib/x86_64-linux-gnu/libX11.so
glfw/tests/opacity: glfw/tests/CMakeFiles/opacity.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lab/BinaryStarModel/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable opacity"
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opacity.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
glfw/tests/CMakeFiles/opacity.dir/build: glfw/tests/opacity

.PHONY : glfw/tests/CMakeFiles/opacity.dir/build

glfw/tests/CMakeFiles/opacity.dir/clean:
	cd /home/lab/BinaryStarModel/source/build/glfw/tests && $(CMAKE_COMMAND) -P CMakeFiles/opacity.dir/cmake_clean.cmake
.PHONY : glfw/tests/CMakeFiles/opacity.dir/clean

glfw/tests/CMakeFiles/opacity.dir/depend:
	cd /home/lab/BinaryStarModel/source/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lab/BinaryStarModel/source /home/lab/BinaryStarModel/source/glfw/tests /home/lab/BinaryStarModel/source/build /home/lab/BinaryStarModel/source/build/glfw/tests /home/lab/BinaryStarModel/source/build/glfw/tests/CMakeFiles/opacity.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : glfw/tests/CMakeFiles/opacity.dir/depend

