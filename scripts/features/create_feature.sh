#!/bin/bash

# Проверяем, передан ли параметр
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <FeatureName>"
    exit 1
fi

# Сохраняем имя фичи в переменную
FEATURE_NAME="$1"

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

dart pub global activate mason_cli 0.1.0-dev.55

# Извлечение имени проекта из pubspec.yaml
cd $PROJECT_ROOT_DIR
PROJECT_NAME=$(grep '^name:' pubspec.yaml | cut -d':' -f2 | xargs)

# Используем переменную для создания фичи с помощью Mason
cd $PROJECT_ROOT_DIR/modules/core
mason make feature --project_name "$PROJECT_NAME" --name $FEATURE_NAME -o $PROJECT_ROOT_DIR/lib/features