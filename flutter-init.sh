#!/bin/bash

mkdir assets
mkdir assets/images
mkdir assets/svg
mkdir assets/fonts

mkdir lib/data
mkdir lib/models
mkdir lib/screens
mkdir lib/widgets

cp -r `dirname "$0"`/common lib/common
cp -r `dirname "$0"`/network lib/network
cp -r `dirname "$0"`/utils lib/utils

rm lib/main.dart 
cp `dirname "$0"`/main.dart lib

echo "Project Initialized Successfully"