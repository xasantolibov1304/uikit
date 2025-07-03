#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR/packages/localization
fvm dart run slang