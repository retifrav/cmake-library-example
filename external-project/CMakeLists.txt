cmake_minimum_required(VERSION 3.15)

project("another-application" VERSION 0.9)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_PREFIX_PATH "/path/to/someLibrary/install")
find_package(SomeLibrary CONFIG REQUIRED)

set(sources
    main.cpp
)

add_executable(${CMAKE_PROJECT_NAME} ${sources})

target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE some::SomeLibrary)
