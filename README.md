# Flutter Init

Opinionated script to initialize a flutter project with the commonly used directories,
in addition to some common files and utilities

## Usage

* Clone this project
* Open the root of your flutter project in the terminal
* Run the following command: `path/to/script/flutter-init.sh`

## Notes

* You need to add `dio` to your `pubspec.yaml` because it's used in the network folder.
If you're using firebase instead of a custom backend, delete the `network/common.dart` file. 

* You need to add the [`lint` package](https://pub.dev/packages/lint) to your `dev_dependencies` because it's used for the `analysis_options.yaml`.
If you want to write your own custom rules, remove the line `include: package:lint/analysis_options.yaml` from your 
project's `analysis_options.yaml`
