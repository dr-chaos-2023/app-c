#!/bin/bash
rootDir=$(pwd)
find "$rootDir" -type f -name "*.c" -print | sed "s|$rootDir/||"