# Flutter Init

Opinionated script to initialize a flutter project with the commonly used directories,
in addition to some common files and utilities

## Usage

* Clone this project
* Open the root of your flutter project in the terminal
* Run the following command: `path/to/script/flutter-init.sh`

## Notes

You need to add `dio` to your `pubspec.yaml` because it's used in the network folder.
If you're using firebase instead of a custom backend, delete the `network/common.dart` file. 