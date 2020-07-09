cmake_minimum_required(VERSION 3.12)
project(StarStuff VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)

find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)

include_directories(include)
include_directories("glfw/include")

set(GLFW_BUILD_DOCS off CACHE BOOL "" FORCE)
set(GLFW_BUILD_TEST off CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES off CACHE BOOL "" FORCE)

add_subdirectory( glfw )

include_directories($(GLEW_INCLUDE_DIRS))
link_libraries(${GLEW_LIBRARIES})

file(GLOB SOURCES "src/*.cpp")
add_executable(StarStuff ${SOURCES})
target_link_libraries(StarStuff OpenGL::GL)
target_link_libraries(StarStuff glfw)
