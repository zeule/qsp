cmake_minimum_required(VERSION 3.15.0 FATAL_ERROR)

project(QSPFoundation)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/Modules)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

add_subdirectory(qsp)
add_subdirectory(txt2gam)

find_package(Qt5 5.11 COMPONENTS Core Widgets)

if (Qt5Widgets_FOUND)
	add_subdirectory(qgen)
endif()
