#!/bin/bash

make clean 

export PATH=$PATH:~/Projects/qtpipeline/checkclass.h

export PATH=$PATH: /QtJenkins/libs/utilities/


echo PATH

cmake -DGOOGLE_TEST=ON

make -j4

ctest -C Debug


