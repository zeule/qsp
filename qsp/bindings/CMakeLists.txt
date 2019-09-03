add_subdirectory(default)

install(FILES
		qsp.h bindings_config.h
	DESTINATION
	${CMAKE_INSTALL_INCLUDEDIR}/qsp
)
