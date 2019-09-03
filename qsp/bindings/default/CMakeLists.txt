target_sources(qsp PRIVATE
default_callbacks.c
default_control.c
)

install(FILES qsp_default.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/qsp/bindings/default)
