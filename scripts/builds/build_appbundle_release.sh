#!/bin/bash

# Определение корневой директории проекта
PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR

fvm flutter clean

fvm flutter pub get

fvm flutter build appbundle --release --flavor=production