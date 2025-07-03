#!/bin/bash

# Проверяем наличие аргументов
if [ "$#" -ne 3 ]; then
    echo "Использование: $0 <путь к директории> <старое название> <новое название>"
    exit 1
fi

# Считываем аргументы
root_directory=$1
old_name=$2
new_name=$3

# Переименовываем директории
find "$root_directory" -type d -name "*$old_name*" | tac | while read -r dir
do
    new_dir=$(echo "$dir" | sed "s/$old_name/$new_name/g")
    mv "$dir" "$new_dir"
done

# Переименовываем файлы и изменяем содержимое
find "$root_directory" -type f -name "*$old_name*.dart" | while read -r file
do
    new_file=$(echo "$file" | sed "s/$old_name/$new_name/g")
    mv "$file" "$new_file"
    
    # Замена в содержимом файла
    sed -i "s/$old_name/$new_name/g" "$new_file"

    # Замена с учетом CamelCase
    old_name_camel=$(echo $old_name | sed -r 's/(^|_)([a-z])/\U\2/g')
    new_name_camel=$(echo $new_name | sed -r 's/(^|_)([a-z])/\U\2/g')
    
    sed -i "s/$old_name_camel/$new_name_camel/g" "$new_file"
done
