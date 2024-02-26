# libjxl + Xcode

A wrapper for [libjxl](https://github.com/libjxl/libjxl) + Xcode project.
This enables Carthage support
This also contains the Swift Package Manager support

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/SDWebImage/libjxl-Xcode)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)

## Requirements

+ iOS 9+
+ macOS 10.11+
+ tvOS 9.0+
+ watchOS 2.0+
+ visionOS 1.0+

## Installation

#### CocoaPods

libjxl is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'libjxl'
```

### Carthage

libjxl is (via this repo) available through [Carthage](https://github.com/Carthage/Carthage).

```
github "SDWebImage/libjxl-Xcode"
```

### SwiftPM

Libjxl is available through [Swift Package Manager](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg).

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/SDWebImage/libjxl-Xcode", from: "0.10.0")
    ],
    // ...
)
```

## Usage

Use libjxl as you would normally, this is just a repo that adds an Xcode proj.

For Swift Package Manager user, it's recommended to use the modular import instead of C headers.

+ Objective-C

```objective-c
@import libjxl;
// or if you don't use module
#import <jxl/decode.h>
#import <jxl/encode.h>
```

+ Swift

```swift
import libjxl
```

## License

libjxl is available under the BSD 3-Clause license. See [the LICENSE file](https://github.com/libjxl/libjxl/blob/main/LICENSE) for more info.


