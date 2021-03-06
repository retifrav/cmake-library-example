cmake_minimum_required(VERSION 3.15)

set(target "some-project")
project(${target})

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(libraries)

set(sources
    main.cpp
)

add_executable(${target} ${sources})

target_link_libraries(${target} PRIVATE SomeLibrary)
