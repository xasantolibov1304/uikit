#!/bin/bash

# Скрипт, который выполняет переданную команду для каждого модуля в проекте
# Пример: bash ./each_module_command_executor.sh --command="echo 'Hello, world!'"

### Итерируем аргументы и записываем в переменные
###
for i in "$@"; do
  case $i in
        --command=*)
        command_to_execute="${i#*=}"
        shift # past argument=value
        ;;
        *)
              # unknown option
        ;;
  esac
done

if [ -z "$command_to_execute" ]; then
    echo "Ошибка: Вы не передали команду."
    exit 1
fi

# Определение корневой директории проекта
PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

# Директории для модулей и пакетов
MODULES_DIR="$PROJECT_ROOT_DIR/modules"
PACKAGES_DIR="$PROJECT_ROOT_DIR/packages"

# Функция для выполнения заданной команды в директории
execute_command() {
    echo "Executing '$command_to_execute' in $1"
    cd "$1"
    eval $command_to_execute
    echo "Finished executing in $1"
}

# Для модулей
for module in "$MODULES_DIR"/*; do
    if [ -d "$module" ] && [ -f "$module/pubspec.yaml" ]; then
        execute_command "$module"
    fi
done

# Для пакетов
for package in "$PACKAGES_DIR"/*; do
    if [ -d "$package" ] && [ -f "$package/pubspec.yaml" ]; then
        execute_command "$package"
    fi
done

# Запуск команды в корневом каталоге проекта
execute_command "$PROJECT_ROOT_DIR"