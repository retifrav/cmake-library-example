cmake_minimum_required(VERSION 3.15)

set(target "SomeLibrary")
if (NOT DEFINED CMAKE_PROJECT_NAME)
    project(${target} DESCRIPTION "Some library")
    message(STATUS "Project hasn't been set, so now it's ${CMAKE_PROJECT_NAME}")
else()
    message(STATUS "Project name has been already set: ${CMAKE_PROJECT_NAME}")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# for CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_BINDIR, CMAKE_INSTALL_INCLUDEDIR and others
include(GNUInstallDirs)

set(sources
    src/some.cpp
)

add_library(${target} STATIC ${sources})

target_include_directories(${target}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

# compile options for this target only
# treat warnings as errors
target_compile_options(${target} PRIVATE -Werror)

# without it public headers won't get installed
set(public_headers
    include/some.h
)
# note that ${public_headers} should be in quotes
set_target_properties(${target} PROPERTIES PUBLIC_HEADER "${public_headers}")

if(DEFINED CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    message(
        STATUS
        "CMAKE_INSTALL_PREFIX is not set\n"
        "Default value: ${CMAKE_INSTALL_PREFIX}\n"
        "Will set it to ${CMAKE_SOURCE_DIR}/install"
    )
    set(CMAKE_INSTALL_PREFIX
        "${CMAKE_SOURCE_DIR}/install"
        CACHE PATH "Where the library will be installed to" FORCE
    )
else()
    message(
        STATUS
        "CMAKE_INSTALL_PREFIX is set\n"
        "Current value: ${CMAKE_INSTALL_PREFIX}"
    )
endif()

set_target_properties(${target} PROPERTIES DEBUG_POSTFIX "d")

install(TARGETS ${target}
    EXPORT "${target}Config"
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} # lib
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} # lib
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} # bin
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR} # include
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${target} # include/SomeLibrary
)
install(
    EXPORT "${target}Config"
    FILE "${target}Config.cmake"
    NAMESPACE some::
    DESTINATION cmake
)
