set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VENDOR "Some Company")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Simple C++ library")
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
SET(CPACK_OUTPUT_FILE_PREFIX "packages")
set(CPACK_PACKAGING_INSTALL_PREFIX "/usr/local")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_VERBATIM_VARIABLES YES)

set(CPACK_PACKAGE_CONTACT "YOUR@E-MAIL.net")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "YOUR NAME")
#set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

# if(WIN32)
#     set(CPACK_GENERATOR ZIP)
# elseif(APPLE)
#     set(CPACK_GENERATOR TGZ productbuild)
# elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
#     set(CPACK_GENERATOR TGZ DEB)
# else()
#     set(CPACK_GENERATOR TGZ)
# endif()

# conditional packing of components
# if(NOT MYPROJ_PACKAGE_HELP)
#     set(CPACK_COMPONENTS_ALL
#         MyProj_Runtime
#         MyProj_Development
#     )
# endif()

# package name for deb
# if set, then instead of SomeLibrary-0.9.1-Darwin.deb
# you'll get somelibrary_0.9.1_darwin-amd64.deb
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)

include(CPack)

# components and groups
# cpack_add_component(${PROJECT_NAME}_runtime
#     DISPLAY_NAME  Runtime
#     DESCRIPTION   "Shared libraries and executables"
#     REQUIRED
#     INSTALL_TYPES Full Developer Minimal
# )
# cpack_add_component(${PROJECT_NAME}_development
#     DISPLAY_NAME  "Developer pre-requisites"
#     DESCRIPTION   "Headers/static libs needed for building"
#     DEPENDS       ${PROJECT_NAME}_runtime
#     GROUP         ${PROJECT_NAME}_SDK
#     INSTALL_TYPES Full Developer
# )
# cpack_add_component(${PROJECT_NAME}_samples
#     DISPLAY_NAME  "Code samples"
#     GROUP         ${PROJECT_NAME}_help
#     INSTALL_TYPES Full Developer
#     DISABLED
# )
# cpack_add_component(${PROJECT_NAME}_docs
#     DISPLAY_NAME  "API documentation"
#     GROUP         ${PROJECT_NAME}_help
#     INSTALL_TYPES Full Developer
#     DISABLED
# )
# cpack_add_component_group(${PROJECT_NAME}_SDK
#     DISPLAY_NAME  SDK
#     DESCRIPTION   "Developer tools, libraries, etc."
# )
# cpack_add_component_group(${PROJECT_NAME}_help
#     DISPLAY_NAME  Documentation
#     DESCRIPTION   "Code samples and API docs"
#     PARENT_GROUP  ${PROJECT_NAME}_SDK
# )
# cpack_add_install_type(Full)
# cpack_add_install_type(Minimal)
# cpack_add_install_type(Developer
#     DISPLAY_NAME "SDK"
# )
