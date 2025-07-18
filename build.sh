#!/bin/bash

if [ ! -d "build" ]; then
  mkdir build && cd build || exit
else
  cd build || exit
fi

if [ "$1" == "definitions" ]; then
  cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
  exit
elif [ "$1" == "release" ]; then
  cmake -DCMAKE_BUILD_TYPE=Release ..
elif [ "$1" == "debug" ]; then
  cmake -DCMAKE_BUILD_TYPE=Debug ..
elif [ "$1" == "examples" ]; then 
  cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_EXAMPLES=ON ..
fi

if [ "$2" = "silent" ]; then
  make -j $(nproc) --no-print-directory
else 
  make -j $(nproc)
fi
