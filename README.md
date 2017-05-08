BlockyGestures is a small framework written in Swift that allows you to create gesture recognizers that execute a closure instead of the old target-action pattern.

- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Installation](#installation)
- [Communication](#communication)
- [Credits](#credits)
- [License](#license)

## Features

- [x] Cocoapods support
- [x] Carthage support

## Requirements

- iOS 8.0+
- Xcode 8.1+
- Swift 3.0+

## Usage

```swift
import BlockyGestures
```

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build BlockyGestures 1.0.0+.

To integrate BlockyGestures into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'BlockyGestures', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate BlockyGestures into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "lordzsolt/BlockyGestures" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `BlockyGestures.framework` into your Xcode project.

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Credits

## License

BlockyGestures is released under the MIT license. [See LICENSE](https://github.com/lordzsolt/BlockyGestures/blob/master/LICENSE) for details.