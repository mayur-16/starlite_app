name: CI
on:
push:
branches:
- main

jobs:
build:
runs-on: ubuntu-latest
steps:
- name: Checkout code
uses: actions/checkout@v3

- name: Set up JDK 17
uses: actions/setup-java@v3
with:
distribution: 'zulu'
java-version: '17'
cache: 'gradle'
id: setup-java

- name: Set up Flutter
uses: subosito/flutter-action@v2
with:
flutter-version: '3.10'
cache: true
id: setup-flutter

- name: Cache Pub dependencies
uses: actions/cache@v3
with:
path: ~/.pub-cache
key: ${{ runner.os }}-pub-cache-${{ hashFiles('**/pubspec.lock') }}
restore-keys: |
${{ runner.os }}-pub-cache-

- name: Get dependencies
run: flutter pub get


#      - name: Analyze
#        run: flutter analyze


- name: Build
run: flutter build apk --release -t "lib/main_dev.dart" --flavor dev --build-name=1.0.${{ github.run_number }} --build-number=${{ github.run_number }}
id: build

- name: Cache Firebase Distribution
uses: actions/cache@v3
with:
path: ~/.cache/firebase
key: ${{ runner.os }}-firebase-${{ hashFiles('**/firebase.json') }}
restore-keys: |
${{ runner.os }}-firebase-

- name: Upload artifact to Firebase App Distribution
uses: wzieba/Firebase-Distribution-Github-Action@v1.5.0
with:
appId: ${{ secrets.FIREBASE_APP_ID_ANDROID }}
serviceCredentialsFileContent: ${{ secrets.SERVICE_CREDENTIALS_FILE_CONTENT }}
groups: internal_testers
file: build/app/outputs/flutter-apk/app-dev-release.apk
id: firebase-upload