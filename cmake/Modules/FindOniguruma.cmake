#  Oniguruma::Onig - target to link to

# Redistribution and use is allowed according to the terms of the BSD license.


if (NOT TARGET Oniguruma::Onig)
	include(FindPackageHandleStandardArgs)
	if (NOT WIN32)
		# use pkg-config to get the directories and then use these values
		include(FindPkgConfig)
		message(VERBOSE "FindOnigurama: trying pkg-config")
		pkg_check_modules(ONIGURUMA REQUIRED IMPORTED_TARGET GLOBAL oniguruma)
		add_library(Oniguruma::Onig ALIAS PkgConfig::ONIGURUMA)
		set(Oniguruma_FOUND True)
	else(NOT WIN32)
		find_library(_onig_lib NAMES onig)
		find_path(_onig_include_dir NAMES oniguruma.h PATH_SUFFIXES oniguruma)
		if (_onig_lib AND _onig_include_dir)
			add_library(Oniguruma::Onig UNKNOWN IMPORTED)
			set_target_properties(Oniguruma::Onig PROPERTIES
				INTERFACE_INCLUDE_DIRECTORIES "${_onig_include_dir}"
				IMPORTED_LINK_INTERFACE_LANGUAGES "C"
				IMPORTED_LOCATION "${_onig_lib}"
			)
		else(_onig_lib AND _onig_include_dir)
		find_package_handle_standard_args(Oniguruma
			REQUIRED_VARS _onig_lib _onig_include_dir)
		endif(_onig_lib AND _onig_include_dir)
	endif(NOT WIN32)
endif(NOT TARGET Oniguruma::Onig)
