# UIKit

Skeleton project with architecture and dependencies.

![Version](https://img.shields.io/badge/version-1.0.0%2B6-red)
![Version](https://img.shields.io/badge/flutter-3.32.4-blue)

After cloning the project, you need to run the following command to generate the files:

```
dart pub global activate mason_cli
cd modules/core && mason init && mason get && cd ../..
```

If you have create_feature.sh: line 20: mason: command not found, then run:

```
export PATH="$PATH":"$HOME/.pub-cache/bin"
```
---
# Generate Files

You can run the following shell to generate files in the project:

```
cd scripts && sh create_feature.sh <FeatureName> && cd ..
cd scripts && sh generate_all.sh && cd ..
cd scripts && sh generate_assets.sh && cd ..
cd scripts && sh generate_localization.sh && cd ..
cd scripts && sh generate_models.sh && cd ..
cd scripts && sh sort_all_imports.sh && cd ..
cd scripts && sh update_dependencies.sh && cd ..
```

--- 
# Build
Run the following command to build the project:

## Android

```
cd scripts && cd builds && sh build_apk_prod.sh && cd .. && cd ..
cd scripts && cd builds && sh build_apk_dev.sh && cd .. && cd ..
cd scripts && cd builds && sh build_appbundle_release.sh && cd .. && cd ..
```

## iOS

```
cd scripts && cd builds && sh build_ios_prod.sh && cd .. && cd ..
cd scripts && cd builds && sh build_ios_dev.sh && cd .. && cd ..
```
---
# General commands

You can run the following command to clean up the project:

```
fvm flutter pub cache repair && fvm flutter clean && fvm flutter pub get
```

or

```
fvm dart run build_runner build --delete-conflicting-outputs &&
fvm flutter pub run import_sorter:main && # generate files

cd packages/localization &&
fvm dart run slang && cd ../.. && # generate localization files

cd packages/uikit &&
fvm dart run build_runner build --delete-conflicting-outputs &&
fvm flutter pub run import_sorter:main && cd ../.. # generate assets in uikit

fvm flutter clean
fvm flutter pub get
fvm flutter build apk --release --no-tree-shake-icons # build APK
fvm flutter build ios --release --no-tree-shake-icons # build iOS

fvm flutter run lib/main_prod.dart --flavor production --dart-define=environment=production -t lib/main_prod.dart # run production
fvm flutter run lib/main_dev.dart --flavor development --dart-define=environment=development -t lib/main_dev.dart # run development
```
---

# Otp hash string

To get the debug hash string, you can use the following code in your otp screen:

```
SmsAutoFill().getAppSignature.then((value) => print('signature: ' + value));
```

Before you can use the SMS Retriever API, you need to generate a hash string that includes your app's package name and the signing certificate. To generate the hash string, do the following:

1. Add your key.properties to android folder with the following content:

```
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=your_key_alias
storeFile=your_store_file
```

2. Download your app signing certificate ([deployment_cert.der](https://play.google.com/apps/publish/)) from the App signing section of the Google Play console.
3. Get your deployment_cert.der file and place it in the scripts folder.
4. Run the following command in BASH only to generate the hash string:

```
cd scripts && source generate_otp_hash.sh && cd ..
```

5. Paste the keyPassword in the terminal and press Enter. After the key is generated, your deployment_cert.der file will be deleted.
6. Copy the hash string and add it to your sms.

P.S. This only works with build from the Play Store.