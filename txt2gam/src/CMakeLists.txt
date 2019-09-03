project(txt2gam)

add_executable(txt2gam)

target_sources(txt2gam PRIVATE
coding.c
locations.c
memwatch.c
text.c
main.c
)

target_link_libraries(txt2gam PRIVATE qsp)

install(TARGETS txt2gam DESTINATION ${CMAKE_INSTALL_BINDIR})
