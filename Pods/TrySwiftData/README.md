# trySwiftData

[![CI Status](https://img.shields.io/travis/Alvin%20Varghese/trySwiftData.svg?style=flat)](https://travis-ci.org/Alvin%20Varghese/trySwiftData)
[![Version](https://img.shields.io/cocoapods/v/trySwiftData.svg?style=flat)](https://cocoapods.org/pods/trySwiftData)
[![License](https://img.shields.io/cocoapods/l/trySwiftData.svg?style=flat)](https://cocoapods.org/pods/trySwiftData)
[![Platform](https://img.shields.io/cocoapods/p/trySwiftData.svg?style=flat)](https://cocoapods.org/pods/trySwiftData)

## How to Make Changes
1. Make the change in the appropriate file in `TrySwiftData` -> `Tests` -> `TKO2017` folder
2. Run the tests
3. Check for the printed out message with the newly generated `.realm` file such as `Successfully generated at /Users/natashatherobot/Library/Developer/CoreSimulator/Devices/D8989664-9BC5-4DA7-B5E4-E0A1F9B5AE3F/data/tmp/tryswift-tokyo2017.realm`
4. Open the printed out folder to get the newly generated `.realm` file
5. Replace the current `tokyo.realm` file with the newly generated `tokyo.realm` file from the `tmp` folder
6. Run `pod update` in the try! Swift Final app

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

trySwiftData is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'trySwiftData', :git => 'https://github.com/tryswift/trySwiftData.git'
```

## Author

Natasha Murashev, natasha@tryswift.co
Alvin Varghese, alvinvarghese@live.com

## License

trySwiftData is available under the MIT license. See the LICENSE file for more info.
