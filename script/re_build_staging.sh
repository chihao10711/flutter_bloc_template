cat .env.staging > .env

flutter clean

flutter pub get

flutter pub run build_runner build --delete-conflicting-outputs

# dart run script/replece_file.dart
