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
include CMakeFiles/StarStuff.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/StarStuff.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/StarStuff.dir/flags.make

CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.o: CMakeFiles/StarStuff.dir/flags.make
CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.o: ../src/IndexBuffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.o -c /home/lab/BinaryStar/src/IndexBuffer.cpp

CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lab/BinaryStar/src/IndexBuffer.cpp > CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.i

CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lab/BinaryStar/src/IndexBuffer.cpp -o CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.s

CMakeFiles/StarStuff.dir/src/Renderer.cpp.o: CMakeFiles/StarStuff.dir/flags.make
CMakeFiles/StarStuff.dir/src/Renderer.cpp.o: ../src/Renderer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/StarStuff.dir/src/Renderer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/StarStuff.dir/src/Renderer.cpp.o -c /home/lab/BinaryStar/src/Renderer.cpp

CMakeFiles/StarStuff.dir/src/Renderer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/StarStuff.dir/src/Renderer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lab/BinaryStar/src/Renderer.cpp > CMakeFiles/StarStuff.dir/src/Renderer.cpp.i

CMakeFiles/StarStuff.dir/src/Renderer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/StarStuff.dir/src/Renderer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lab/BinaryStar/src/Renderer.cpp -o CMakeFiles/StarStuff.dir/src/Renderer.cpp.s

CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.o: CMakeFiles/StarStuff.dir/flags.make
CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.o: ../src/VertexBuffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.o -c /home/lab/BinaryStar/src/VertexBuffer.cpp

CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lab/BinaryStar/src/VertexBuffer.cpp > CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.i

CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lab/BinaryStar/src/VertexBuffer.cpp -o CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.s

CMakeFiles/StarStuff.dir/src/application.cpp.o: CMakeFiles/StarStuff.dir/flags.make
CMakeFiles/StarStuff.dir/src/application.cpp.o: ../src/application.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/StarStuff.dir/src/application.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/StarStuff.dir/src/application.cpp.o -c /home/lab/BinaryStar/src/application.cpp

CMakeFiles/StarStuff.dir/src/application.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/StarStuff.dir/src/application.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lab/BinaryStar/src/application.cpp > CMakeFiles/StarStuff.dir/src/application.cpp.i

CMakeFiles/StarStuff.dir/src/application.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/StarStuff.dir/src/application.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lab/BinaryStar/src/application.cpp -o CMakeFiles/StarStuff.dir/src/application.cpp.s

# Object files for target StarStuff
StarStuff_OBJECTS = \
"CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.o" \
"CMakeFiles/StarStuff.dir/src/Renderer.cpp.o" \
"CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.o" \
"CMakeFiles/StarStuff.dir/src/application.cpp.o"

# External object files for target StarStuff
StarStuff_EXTERNAL_OBJECTS =

StarStuff: CMakeFiles/StarStuff.dir/src/IndexBuffer.cpp.o
StarStuff: CMakeFiles/StarStuff.dir/src/Renderer.cpp.o
StarStuff: CMakeFiles/StarStuff.dir/src/VertexBuffer.cpp.o
StarStuff: CMakeFiles/StarStuff.dir/src/application.cpp.o
StarStuff: CMakeFiles/StarStuff.dir/build.make
StarStuff: /usr/lib/x86_64-linux-gnu/libGLEW.so
StarStuff: glfw/src/libglfw3.a
StarStuff: /usr/lib/x86_64-linux-gnu/libGLX.so
StarStuff: /usr/lib/x86_64-linux-gnu/libOpenGL.so
StarStuff: /usr/lib/x86_64-linux-gnu/librt.so
StarStuff: /usr/lib/x86_64-linux-gnu/libm.so
StarStuff: /usr/lib/x86_64-linux-gnu/libX11.so
StarStuff: CMakeFiles/StarStuff.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lab/BinaryStar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable StarStuff"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/StarStuff.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/StarStuff.dir/build: StarStuff

.PHONY : CMakeFiles/StarStuff.dir/build

CMakeFiles/StarStuff.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/StarStuff.dir/cmake_clean.cmake
.PHONY : CMakeFiles/StarStuff.dir/clean

CMakeFiles/StarStuff.dir/depend:
	cd /home/lab/BinaryStar/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lab/BinaryStar /home/lab/BinaryStar /home/lab/BinaryStar/build /home/lab/BinaryStar/build /home/lab/BinaryStar/build/CMakeFiles/StarStuff.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/StarStuff.dir/depend

