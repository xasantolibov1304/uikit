#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

# Загрузка переменных окружения
source $PROJECT_ROOT_DIR/android/key.properties

KEY_ALIAS=$keyAlias
PACKAGE_NAME=$(grep 'applicationId' $PROJECT_ROOT_DIR/android/app/build.gradle | sed 's/.*applicationId "//;s/".*//')

echo "Key alias: $KEY_ALIAS"
echo "Package name: $PACKAGE_NAME"

# Получаем пароль от пользователя вводим из key.properties поле keyPassword=...
echo "Enter the password for the keystore: "
read -s KEY_PASSWORD

# Получаем сертификат из файла deployment_cert.der и импортируем его в хранилище ключей certificate.jks
keytool -importcert -alias $KEY_ALIAS -file deployment_cert.der -keystore certificate.jks -storepass $KEY_PASSWORD -noprompt

# Получаем хэш от сертификата и пакета
RESULT=$(keytool -exportcert -alias $KEY_ALIAS -keystore certificate.jks -storepass $KEY_PASSWORD | xxd -p | tr -d "[:space:]" | echo -n $PACKAGE_NAME `cat` | shasum -a 256 | tr -d "[:space:]-" | xxd -r -p | base64 | cut -c1-11)

# Выводим результат
echo "Generated result: $RESULT"

# Удаляем сертификат и хранилище ключей
rm certificate.jks
rm deployment_cert.der