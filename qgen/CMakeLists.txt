project(qgen)

add_executable(qgen)

target_sources(qgen PRIVATE
source/locations_list_box.cpp
source/main.cpp
source/main_window.cpp
source/main_window_presenter.cpp
source/menu_bar.cpp
source/settings.cpp
source/tool_bar.cpp
include/i_main_window_model.h
include/i_main_window_presenter.h
include/i_main_window_view.h
include/locations_list_box.h
include/main_window.h
include/main_window_presenter.h
include/menu_bar.h
include/settings.h
include/tool_bar.h
resource/main_window.qrc
)

set_target_properties(qgen PROPERTIES
	AUTOMOC True
	AUTORCC True
	AUTOUIC True
)

target_include_directories(qgen PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}/include
	${CMAKE_CURRENT_SOURCE_DIR}/precompiled
)

target_link_libraries(qgen PRIVATE
	Qt5::Gui
	Qt5::Widgets
	qsp
)

