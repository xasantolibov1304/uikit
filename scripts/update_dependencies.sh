#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR
dart pub global activate fvm 3.1.7

echo "-- run fvm --version"
fvm --version

echo "-- run fvm install"
fvm install

echo "-- run flutter clean"
fvm flutter clean

echo "-- run flutter doctor"
fvm flutter doctor -v

echo "-- run pub get"
cd $PROJECT_ROOT_DIR/scripts/utils
bash each_module_command_executor.sh --command="fvm flutter pub get"