cmake_minimum_required (VERSION 2.8)
project (liblogitechcpp)

find_package(LibLogitech)
find_package(LibLogiToolsDL)
find_package(LibLogitechRender)

set(PACKAGE_STRING "liblogitechcpp")

configure_file("${PROJECT_SOURCE_DIR}/liblogitechcpp.pc.in" "${PROJECT_BINARY_DIR}/liblogitechcpp.pc" @ONLY)
include_directories(${LIBLOGITECH_INCLUDE_DIRS} ${LIBLOGITOOLSDL_INCLUDE_DIRS} ${LIBLOGITECHRENDER_INCLUDE_DIRS} "${PROJECT_BINARY_DIR}")

add_library(logitechcpp SHARED src/G15Canvas.cpp src/G15Screen.cpp src/G15Wbmp.cpp)

target_link_libraries(logitechcpp ${LIBLOGITECH_LIBRARIES} ${LIBLOGITOOLSDL_LIBRARIES} ${LIBLOGITECHRENDER_LIBRARIES} usb pthread)

install(TARGETS logitechcpp LIBRARY DESTINATION lib)
install(FILES "${PROJECT_BINARY_DIR}/liblogitechcpp.pc" DESTINATION lib/pkgconfig)
install(FILES src/G15Canvas.h src/G15Screen.h src/G15Wbmp.h DESTINATION include/logitechcpp)
install(FILES cmake/Modules/FindLibLogitechCPP.cmake DESTINATION share/cmake/Modules)
