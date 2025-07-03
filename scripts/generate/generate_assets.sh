#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

# project
cd $PROJECT_ROOT_DIR
fluttergen -c pubspec.yaml

# uikit
cd $PROJECT_ROOT_DIR/packages/uikit
fluttergen -c pubspec.yaml