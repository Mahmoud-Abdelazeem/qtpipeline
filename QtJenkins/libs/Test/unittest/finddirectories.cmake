cmake_minimum_required(VERSION 3.10.2)

  message(STATUS "THE Project dir is ${PROJECT_SOURCE_DIR}")
  get_filename_component(DIR_Distimatic ../../../ ABSOLUTE)
    message(STATUS "THE Current DIR is: ${DIR_Distimatic}")

   include_directories(${DIR_Distimatic}/libs/Benchtop)
   include_directories(${DIR_Distimatic}/libs/Benchtop)
   
      include_directories(${DIR_Distimatic}/libs/Benchtop)


        include_directories(${DIR_Distimatic}/libs/Benchtop)

    set(LIB_FOLDER
       #~/Projects/JenkinsPipeline/pipelineJenkins/
       ${DIR_Distimatic}/libs/Benchtop
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
