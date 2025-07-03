#!/bin/bash

# Проверяем количество параметров
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <flavor>"
  exit 1
fi

# Сохраняем параметры в переменные
FLAVOR=$1

# Определение корневой директории проекта
PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR

fvm flutter clean

fvm flutter pub get

fvm flutter build apk --release --flavor=$FLAVOR