cmake_minimum_required(VERSION 3.10.2)

project(unittesting)

# Instruct CMake to run moc automatically when needed
set(CMAKE_AUTOMOC ON)

set(CMAKE_CXX_STANDARD 14)

set(HEADERS
   )

set(SOURCES
     )

# Locate GTest
find_package(GTest REQUIRED)
message (STATUS "gTest ${GTEST}")
include_directories(${GTEST_INCLUDE_DIR})

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# find all Qt Packages
find_package(Qt5Core CONFIG REQUIRED)

# Find the QtWidgets library
find_package(Qt5Widgets CONFIG REQUIRED)

#add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

# Use the Widgets module from Qt5 and the core of Qt
#target_link_libraries(${PROJECT_NAME} Qt5::Widgets Qt5::Core Qt5::Gui)

# Link runTest with what we want to test, GTest and pthread library
#target_link_libraries(${PROJECT_NAME} ${GTEST_LIBRARIES} pthread)

#include(~/vcpkg/scripts/buildsystems/vcpkg.cmake)

set(sympath "${CMAKE_CURRENT_SOURCE_DIR}")
set(filepath "${../../SymbolicLink2/}")

# try to create the first system link  with a macro, just one file
macro(install_symlink filepath sympath)

    install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink ${filepath} ${sympath})")
    install(CODE "message(\"-- Created symlink: ${sympath} -> ${filepath}\")")
    message(STATUS "system link intalled")

endmacro(install_symlink)

# Call the macro to create the symbolic link
install_symlink(filepath sympath)

# create a folder where all of the files will be kept. This folder will be named Test, just for testing.
set(folder "${CMAKE_CURRENT_SOURCE_DIR}/Test")

# try to create the symbolic link and make a copy inside "Test", Take care that commands are executed concurrently as a pipeline
execute_process(
    COMMAND "${CMAKE_COMMAND}" "-E" "create_symlink" " ../../symboliclink" "${folder}"
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

#target_link_libraries(${PROJECT_NAME} gmock)

#here we will add the first subdirectory(unitTesting)
add_subdirectory(unittest)
