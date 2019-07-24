# create a folder where all of the files will be kept. This folder will be named Test, just for testing.
set(folder "${CMAKE_CURRENT_SOURCE_DIR}/FindGoogleMock")

# try to create the symbolic link and make a copy inside "Find googletest", Take care that commands are executed concurrently as a pipeline
execute_process(
    COMMAND "${CMAKE_COMMAND}" "-E" "create_symlink" "/../../googletest/googlemock" "${folder}" # the complete path should be given
    RESULT_VARIABLE result
    OUTPUT_VARIABLE output
    ERROR_VARIABLE error
    )

# output messages to check the status
message(STATUS "RESULT_VARIABLE ${result}")
message(STATUS "OUTPUT_VARIABLE ${output}")
message(STATUS "ERROR_VARIABLE ${error}")

# check if the symbolic link has been created
if(IS_SYMLINK "${folder}")
    message(STATUS "Everything is ok. symbolic link done!")
elseif(NOT result EQUAL 0)
    message(STATUS "Could not create the symbolic link and returned error code. for more information look at the documentaion of execute_process")
else()
    message(FATAL_ERROR "There is something wrong!, not creating the symbolic link but returning code 0 as if it was successful")
endif()
#include_directories(${CMAKE_CURRENT_SOURCE_DIR}/FindGoogleMock/lib)

find_package(GTest)

find_package(PkgConfig)
message(STATUS "PkgConfig ${PkgConfig}")

pkg_check_modules(PC_GMOCK QUIET gmock)
set(GMOCK_DEFINITIONS ${PC_GMOCK_CFLAGS_OTHER})

find_path(GMOCK_INCLUDE_DIR gmock.h
    HINTS ${PC_GMOCK_INCLUDEDIR} ${PC_GMOCK_INCLUDE_DIRS}
    PATH_SUFFIXES gmock
    )

message(STATUS "GMOCK_INCLUDE_DIR ${GMOCK_INCLUDE_DIR}")

find_library(GMOCK_LIBRARY NAMES gmock libgmock
    HINTS ${PC_GMOCK_LIBDIR} ${PC_GMOCK_LIBRARY_DIRS})

message (STATUS "GMOCK_LIBRARY ${GMOCK_LIBRARY}")

find_library(GMOCK_MAIN_LIBRARY NAMES gmock_main libgmock_main
    HINTS ${PC_GMOCK_LIBDIR} ${PC_GMOCK_LIBRARY_DIRS} )

message(STATUS "GMOCK_MAIN_LIBRARY ${GMOCK_MAIN_LIBRARY}")

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set GMOCK_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(GMock DEFAULT_MSG
    GMOCK_LIBRARY GMOCK_INCLUDE_DIR GTEST_FOUND)

mark_as_advanced(GMOCK_INCLUDE_DIR GMOCK_LIBRARY GMOCK_MAIN_LIBRARY)

set(GMOCK_LIBRARIES ${GMOCK_LIBRARY})
set(GMOCK_INCLUDE_DIRS ${GMOCK_INCLUDE_DIR})
set(GMOCK_MAIN_LIBRARIES ${GMOCK_MAIN_LIBRARY})
set(GMOCK_BOTH_LIBRARIES ${GMOCK_LIBRARY} ${GMOCK_MAIN_LIBRARY})
message(STATUS "GMOCK_BOTH_LIBRARIES ARE IN ${GMOCK_BOTH_LIBRARIES}")

if (NOT TARGET GMock)
    add_library(GMock IMPORTED SHARED)
    set_property(TARGET GMock PROPERTY IMPORTED_LOCATION ${GMOCK_LIBRARY})
    set_property(TARGET GMock PROPERTY INTERFACE_INCLUDE_DIRECTORY ${GMOCK_INCLUDE_DIR})

    add_library(GMockMain IMPORTED SHARED)
    set_property(TARGET GMockMain PROPERTY IMPORTED_LOCATION ${GMOCK_MAIN_LIBRARY})
    set_property(TARGET GMockMain PROPERTY INTERFACE_LINK_LIBRARIES GMock GTest)
endif()








