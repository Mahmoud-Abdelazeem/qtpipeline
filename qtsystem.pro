QT -= gui

CONFIG += c++14 console
CONFIG -= app_bundle

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
    pipelineJenkins/unittest/benchtest_autogen/mocs_compilation.cpp \
    pipelineJenkins/unittest/benchtoptest_autogen/mocs_compilation.cpp \
    pipelineJenkins/unittest/CMakeFiles/3.10.2/CompilerIdCXX/CMakeCXXCompilerId.cpp \
    pipelineJenkins/unittest/CMakeFiles/feature_tests.cxx \
    pipelineJenkins/unittest/hahtest_autogen/mocs_compilation.cpp \
    pipelineJenkins/unittest/mahTest/hahtest.cpp \
    pipelineJenkins/unittest/mahTest/mahtest.cpp \
    pipelineJenkins/unittest/mahtest_autogen/mocs_compilation.cpp \
    pipelineJenkins/unittest/testlib_autogen/mocs_compilation.cpp \
    pipelineJenkins/main.cpp \
    ckeckclass.cpp \
    main.cpp \
    pipelineJenkins/unittest/CMakeFiles/3.10.2/CompilerIdC/CMakeCCompilerId.c \
    pipelineJenkins/unittest/CMakeFiles/feature_tests.c

QMAKE_EXTRA_TARGETS += subproject
PRE_TARGETDEPS += subproject

include(test.pri)

HEADERS += \
    checkclass.h \
    pipelineJenkins/unittest/benchtest_autogen/moc_predefs.h \
    pipelineJenkins/unittest/benchtoptest_autogen/moc_predefs.h \
    pipelineJenkins/unittest/hahtest_autogen/moc_predefs.h \
    pipelineJenkins/unittest/mahTest/mahtest.h \
    pipelineJenkins/unittest/mahtest_autogen/moc_predefs.h \
    pipelineJenkins/unittest/testlib_autogen/moc_predefs.h \
    checkclass.h


