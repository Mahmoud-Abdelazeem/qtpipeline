cmake_minimum_required(VERSION 3.10.2)
if(GOOGLE_TEST)
    #set by Gtest. Also set in the integration build environment.
    message(STATUS "show me something")
    enable_testing()

    # adding flag to the compilation of the source file
    add_definitions(-DUNIT_TEST)
    message (STATUS TESTING)

    # add C++14
    set(CMAKE_CXX_STANDARD 14)

    #here we need to include all of the directories. we will start with the current source directory.
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)
    include_directories(${INCLUDE_DIRS})
    #include_directories(${CMAKE_CURRENT_SOURCE_DIR}/FindGoogleTest/cmake)

    # include the other directories that we need to test
    ############################## here #################

    # create a load file .cmake, and set the Gmock targets
    include(findGmock.cmake)

    # include CTest, to run all the tests
    include(CTest)

    # find the required packages, threads and gtest
    find_package(Threads)
    find_package(GTest REQUIRED)

    # find all Qt Packages
    find_package(Qt5Core CONFIG REQUIRED)

    # find the QtWidgets library
    find_package(Qt5Widgets CONFIG REQUIRED)

    #get updated with the messages
    message(STATUS "Threads${Threads}")
    set(GOOGLETEST_VERSION 1.9.0)

    # set the MOC on
    set(CMAKE_AUTOMOC ON)

    # in this step, add all tests file
    set (BENCHTOP_SRC_TEST
        ${CMAKE_CURRENT_SOURCE_DIR}/mahTest/mahtest.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/mahTest/mahtest.h
        ${CMAKE_CURRENT_SOURCE_DIR}/mahTest/hahtest.cpp
        )

    set (BENCHTOP_LIB_TEST
        # Add the libraries you want to add
        #the logging in the future
        PUBLIC
        )

    set (OTHER_LIB_TEST
        PUBLIC ${GMOCK_BOTH_LIBRARIES}
        #add  the Gmock files
        )
    #this library will be used, take care of dependicies!
    set (DISTIMATIC_LIB_TEST  benchtoptest)

    #add the used libraray, STATIC Library
    add_library(${DISTIMATIC_LIB_TEST} STATIC ${BENCHTOP_SRC_TEST})

    # link between all libraries
    target_link_libraries(${DISTIMATIC_LIB_TEST}
        PUBLIC ${BENCHTOP_LIB_TEST}
        PUBLIC ${OTHER_LIB_TEST}
        GTest::GTest GTest::Main
        Qt5::Widgets Qt5::Core Qt5::Gui
        )

    target_include_directories(${DISTIMATIC_LIB_TEST} PRIVATE ${CODING_LIB_INCLUDE_DIRS})

    # target_include_directories?? ToDo In the future

    set (BENCH_TEST_SRC
         ${CMAKE_CURRENT_SOURCE_DIR}/mahTest/mahtest.cpp
        )

    set (BENCH_LIB_TEST benchtest)
    add_library(${BENCH_LIB_TEST} STATIC ${BENCH_TEST_SRC})
    target_link_libraries(${BENCH_LIB_TEST}
                          ${OTHER_LIB_TEST}
                          PUBLIC ${DISTIMATIC_LIB_TEST}
                         )

    #/********************************************//**
    #  ... test 1
    #*************************************************

    #then we need to add the tests.To do that, you have to first
    #1- add the executable files
    add_executable(mahtest
        ${CMAKE_CURRENT_SOURCE_DIR}/mahTest/mahtest.cpp)
    message(STATUS "THE TYPE OF THE LIBRARY ${BENCHTOP_LIB_TEST} ")

    #2- always do the link between the libraries. Otherwise, the CMake will never be able to define the target
    message(STATUS "THE status of the FIRST test is ${mahtest}")
    target_link_libraries(mahtest
        ${OTHER_LIB_TEST}
        ${DISTIMATIC_LIB_TEST}
        )

    #3- add the test itself
    add_test(mahtest mahtest)
    message (STATUS "${mahtest} what is test1")

    #/********************************************//**
    #  ... test 2
    #*************************************************

    # then we need to add the tests.To do that, you have to first
    #1- add the executable files
    add_executable(hahtest
        ${CMAKE_CURRENT_SOURCE_DIR}/mahTest/hahtest.cpp)
    message(STATUS "THE TYPE OF THE LIBRARY ${BENCHTOP_LIB_TEST} ")

    #2- always do the link between the libraries. Otherwise, the CMake will never be able to define the target
    message(STATUS "THE status of the SECOND test is ${hahtest}")
    target_link_libraries(hahtest
        ${OTHER_LIB_TEST}
        ${DISTIMATIC_LIB_TEST}
        )

    #3- add the test itself
    add_test(hahtest hahtest)
    message (STATUS "${hahtest} what is test1")

    #/********************************************//**
    #  ... test 3
    #*************************************************



    #/********************************************//**
    #  ... test 4
    #*************************************************


endif()

# if we need to test something, we need to add it to this folder. just as a "stub"
#add_subdirectory(data)
