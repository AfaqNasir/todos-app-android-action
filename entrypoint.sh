#!/bin/sh

# Set the working directory
cd $INPUT_PROJECT_PATH

# Install dependencies
yarn install

# Build the Android release
cd android
./gradlew assembleRelease

# Set the output APK path
APK_PATH=$(find . -name "*.apk" | head -n 1)

# Set the output variable
echo "::set-output name=apk_path::$APK_PATH"
