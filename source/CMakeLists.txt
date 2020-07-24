cmake_minimum_required(VERSION 3.12)
project(StarStuff VERSION 1.0.0 LANGUAGES CUDA CXX)

set(CMAKE_CXX_STANDARD 17)

find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
find_package(Threads REQUIRED)
find_package(X11 REQUIRED)
include_directories(include)
include_directories("src/vendor/glfw/include")

include_directories("src/vendor/imgui/")
file(GLOB imguiFILES "src/vendor/imgui/*")
source_group(imgui FILES ${imguiFILES})

set(GLFW_BUILD_DOCS off CACHE BOOL "" FORCE)
set(GLFW_BUILD_TEST off CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES off CACHE BOOL "" FORCE)

add_subdirectory( src/vendor/glfw )
add_subdirectory( src/vendor/glm )

include_directories($(GLEW_INCLUDE_DIRS))
link_libraries(${GLEW_LIBRARIES})

file(GLOB SOURCES "src/*.cpp")
add_executable(StarStuff ${SOURCES} ${imguiFILES})
target_link_libraries(StarStuff OpenGL::GL)
target_link_libraries(StarStuff glfw)
