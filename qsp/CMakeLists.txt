project(qsp
	VERSION 5.7.0
)

set(CMAKE_INCLUDE_CURRENT_DIR True)
include(GenerateExportHeader)


find_package(Oniguruma REQUIRED)

add_library(qsp)

target_sources(qsp PRIVATE
actions.c
callbacks.c
codetools.c
coding.c
common.c
errors.c
game.c
locations.c
mathops.c
memwatch.c
menu.c
objects.c
playlist.c
regexp.c
statements.c
text.c
qsptime.c
towlower.c
towupper.c
variables.c
variant.c
)

generate_export_header(qsp
	 BASE_NAME Qsp
	 EXPORT_MACRO_NAME QSP_EXTERN
)

add_subdirectory(bindings)
target_link_libraries(qsp PRIVATE Oniguruma::Onig)

install(TARGETS qsp EXPORT QspTargets DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT runtime)
install(FILES
		"${CMAKE_CURRENT_BINARY_DIR}/qsp_export.h"
	DESTINATION
		"${CMAKE_INSTALL_INCLUDEDIR}/qsp"
)

set(CONF_TARGETS Math)
write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/QspConfigVersion.cmake COMPATIBILITY AnyNewerVersion)
configure_package_config_file(QspConfig.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/QspConfig.cmake
	INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/Qsp"
)

export(TARGETS qsp NAMESPACE Qsp:: FILE "${PROJECT_BINARY_DIR}/QspTargets.cmake")
export(PACKAGE Qsp)
install(EXPORT QspTargets NAMESPACE Qsp:: DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/Qsp")
install(FILES
		${CMAKE_CURRENT_BINARY_DIR}/QspConfigVersion.cmake
		${CMAKE_CURRENT_BINARY_DIR}/QspConfig.cmake
	DESTINATION
		"${CMAKE_INSTALL_LIBDIR}/cmake/Qsp"
)

install(FILES
		${CMAKE_SOURCE_DIR}/cmake/Modules/FindOniguruma.cmake
	DESTINATION
		"${CMAKE_INSTALL_DATAROOTDIR}/cmake/Modules"
)
