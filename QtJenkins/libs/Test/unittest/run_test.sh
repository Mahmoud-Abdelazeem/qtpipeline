#!/bin/bash

set -euo pipefail

# Build script to build the distimatic project.
# Set the flavor in the command line. So far there is no flavor, so default 

# For building cross on desktop Linux, set the following Environmnet variables:
# export WORKSPACE=/path/to/checkout
# export PATH=${WORKSPACE}/buildroot*/output/
# ./buildapp.sh standard Arm
# The WORKSPACE env var is required to find the cross compile toolchain
# 

flavor=${1:-'standard'}

# Set the platform. If "desktop" is set as second parameter, it compiles for Linux,
# otherwise for the Arm platform
flavor=${2:-''}
if [ "$flavor" == "desktop" ]; then
  src_base="`pwd`/.."
  backend="ProcessUI"
  platform="Desktop"
  spec=""
else
  src_base="${WORKSPACE:-'.'}"
  backend="Busmaster"
  platform="Arm"
  # SVN_REVISION is coming from the Jenkins environment
  spec="-r -spec devices/linux-buildroot-g++"
fi

# Fallback values for the jenkins vars
SVN_REVISION=${SVN_REVISION:-"-1"}
BUILD_NUMBER=${BUILD_NUMBER:-"-1"}

if [ ! -x "${my_cmake:-''}" ]
  # if i try which on the terminal, it gives me the required link
  
  my_cmake=`which cmake`|| true
  then
    echo "myCmake Found"
  
  elif [ -z "$my_cmake" ]
  then
    echo "myCmake not found"

fi

echo "######Using myCmake: $my_cmake"
my_cmake="$my_cmake $spec"

# Configuration flags for the cmake calls
# 
cfg_flavor="CONFIG+=$flavor"
cfg_flavor=" "
cfg_backend="CONFIG+=$backend" # could also be ProcessUi
cfg_platform="CONFIG+=$platform"
cfg_revision="DEFINES+=REVISION=$SVN_REVISION DEFINES+=BUILD_NUMBER=$BUILD_NUMBER"

# Do not build in the source, but in a buildroot
my_buildroot="build_$platform"
make_clean="make clean"
make_it="make -j4"
ctest="ctest -C Debug"

if [[ $flavor == "desktop" ]]; then
	if [ -e Makefile ]; then
          echo "found Makefile"
          $make_clean
	else
          echo "not found Makefile"
	fi
    $my_cmake -DGOOGLE_TEST=ON	
    $make_it
    $ctest  

else

    echo " No cmake build,quit"

fi
   

