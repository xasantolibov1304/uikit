#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR/scripts/generate

bash sort_all_imports.sh
bash generate_models.sh
bash generate_assets.sh
bash generate_localization.sh