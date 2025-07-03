#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR/scripts/utils
bash each_module_command_executor.sh --command="fvm flutter pub run import_sorter:main"