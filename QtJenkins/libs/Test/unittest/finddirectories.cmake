cmake_minimum_required(VERSION 3.10.2)

    include_directories(~/Projects/qtpipeline/QtJenkins/libs/utilities)
    include_directories(~/workspace/qtpipeline/QtJenkins/libs/utilities)

    
    set(LIB_FOLDER
        ~/Projects/JenkinsPipeline/pipelineJenkins/
       )
        
    link_directories (${LIB_FOLDER})
    message (STATUS "Give me the Link ${LIB_FOLDER}")
    set (MY_LIB_TEST  testFolder)
    message(STATUS "What is the LIB_TEST ${MY_LIB_TEST}")

    add_library(${MY_LIB_TEST} STATIC ${LIB_FOLDER})
    target_include_directories(${MY_LIB_TEST} PRIVATE ${LIB_FOLDER})
   
    target_link_libraries(${MY_LIB_TEST}
                          PUBLIC ${BENCHTOP_LIB_TEST}
                          PUBLIC ${OTHER_LIB_TEST}
                          PUBLIC ${DISTIMATIC_LIB_TEST}
                         )
