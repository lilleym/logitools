# - Try to find LibLogitechCPP
# Once done this will define
#  LIBLOGITECHCPP_FOUND - System has LibLogitech
#  LIBLOGITECHCPP_INCLUDE_DIRS - The LibLogitech include directories
#  LIBLOGITECHCPP_LIBRARIES - The libraries needed to use LibLogitech

find_package(PkgConfig)

pkg_check_modules(PC_LIBLOGITECHCPP QUIET liblogitechcpp-1.0)

find_path(LIBLOGITECHCPP_INCLUDE_DIR G15Canvas.h HINTS ${PC_LIBLOGITECHCPP_INCLUDEDIR} ${PC_LIBLOGITECHCPP_INCLUDE_DIRS} PATH_SUFFIXES logitechcpp)

find_library(LIBLOGITECHCPP_LIBRARY NAMES logitechcpp HINTS ${PC_LIBLOGITECHCPP_LIBDIR} ${PC_LIBLOGITECHCPP_LIBRARY_DIRS})

set(LIBLOGITECHCPP_LIBRARIES ${LIBLOGITECHCPP_LIBRARY})
set(LIBLOGITECHCPP_INCLUDE_DIRS ${LIBLOGITECHCPP_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(LibLogitechCPP DEFAULT_MSG LIBLOGITECHCPP_LIBRARY LIBLOGITECHCPP_INCLUDE_DIR)

mark_as_advanced(LIBLOGITECHCPP_INCLUDE_DIR LIBLOGITECHCPP_LIBRARY) 
