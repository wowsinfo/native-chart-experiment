#!/bin/bash
cp -r ../NativeChart/ node_modules/react-native-native-chart/
yarn
cd ios && pod install