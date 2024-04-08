# FAKER API

This project is a simple application which fetches list of persons and its details using FakerApi.
Please see this link for its documentation https://fakerapi.it/en for your reference.

## Getting Started
This application can be downloaded for testing purposes, for additional information of the setup
please follow the information indicated below.

* Download ZIP file
    * Go to https://github.com/LuigiGo/FakeAPIExam
    * Select Code Tab
    * Look for Code dropdown
    * Tap Download ZIP

* via terminal
    * Open Terminal
    * Go to desired location folder
    * Create new directory, then navigate once created
    * Enter this command, git clone https://github.com/LuigiGo/FakeAPIExam.git

* via Android Studio
    * Open Android Studio
    * Select File > New > Project from version control
    * Version control wizard will show
    * Tap on URL field, then enter https://github.com/LuigiGo/FakeAPIExam.git
    * Select Clone

Note: For testing purposes, the environment file was included in this repository.

## Android
1. Open terminal in Android Studio
2. Then enter, flutter clean
3. Enter flutter pub get
4. Then flutter pub run build_runner build --delete-conflicting-outputs
5. Connect your open or open a simulator
6. Go to terminal, enter flutter run --dart-define=app.flavor=dev

## IOS
via Android Studio:
1. Open terminal in Android Studio
2. Then enter, flutter clean
3. Enter flutter pub get
4. Then flutter pub run build_runner build --delete-conflicting-outputs
5. In terminal, enter open -a simulator
6. The via terminal, navigate to the ios directory of the project
7. Then enter, pod deintegrate
8. Then pod install
9. Go back to Android studio
10. In device selection dropdown, select IOS simulator as test device
11. In terminal, enter flutter run --dart-define=app.flavor=dev

via XCode:
1. Open XCode, navigate to your project
2. Then select ios directory
3. In XCode, select Runner on the left pane
4. Look for Targets, then select Runner
5. Go to Signing & Capabilities
6. Check Teams, then select your Apple account
7. Open terminal, then navigate to the ios directory of your project
8. Then enter, flutter clean
9. Enter flutter pub get
10. Then flutter pub run build_runner build --delete-conflicting-outputs
11. Enter open -a simulator
12. Then enter, pod deintegrate
13. Then pod install
14. Then flutter build ios --dart-define=app.flavor=dev

## Web
1. Open terminal in Android Studio
2. Then enter, flutter clean
3. Enter flutter pub get
4. Then flutter pub run build_runner build --delete-conflicting-outputs
5. In terminal, enter flutter run -d chrome --dart-define=app.flavor=dev

## Sample Videos
IOS

https://github.com/LuigiGo/FakeAPIExam/assets/18436118/045084eb-80ce-439d-986a-61ea9ece9230


Android

https://github.com/LuigiGo/FakeAPIExam/assets/18436118/e4765748-ee39-4566-a09c-c8a6aa94a278


Web

https://github.com/LuigiGo/FakeAPIExam/assets/18436118/02772758-f22f-40ad-9b90-9738f6ee6049


