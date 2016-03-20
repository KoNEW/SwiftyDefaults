# SwiftyDefaults

[![CI Status](http://img.shields.io/travis/KoNEW/SwiftyDefaults.svg?style=flat-square)](https://travis-ci.org/KoNEW/SwiftyDefaults)
[![Version](https://img.shields.io/cocoapods/v/SwiftyDefaults.svg?style=flat-square)](http://cocoapods.org/pods/SwiftyDefaults)
[![License](https://img.shields.io/cocoapods/l/SwiftyDefaults.svg?style=flat-square)](http://cocoapods.org/pods/SwiftyDefaults)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyDefaults.svg?style=flat-square)](http://cocoapods.org/pods/SwiftyDefaults)

## Description

SwiftyDefaults provides accessing to NSUserDefaults using property.

## Installation

SwiftyDefaults is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftyDefaults"
```

## Example of usage

```swift
import SwiftyDefaults

class MyDefaults: SwiftyDefaults {
    dynamic var value1: String? = nil
    dynamic var value2: String = "Some value"
    dynamic var value3: Int = 1
    dynamic var value4: Person? = nil // Person class conforms to NSCoding procotol
}

let md = MyDefaults()

print("Value1: \(md.value1)") // nil
print("Value2: \(md.value2)") // "Some value"
print("Value3: \(md.value3)") // 1
print("Value4: \(md.value4)") // nil

md.value1 = "Some another value"
md.value2 = "Some another value 2"
md.value3 = 10
md.value4 = Person(firstName: "Elvis", lastName: "Presley", age: 42)

print("Value1: \(md.value1)") // Optional("Some another value")
print("Value2: \(md.value2)") // "Some an0ther value 2"
print("Value3: \(md.value3)") // 10
print("Value4: \(md.value4)") // Optional(Person=(Optional("Elvis"), Optional("Presley"), 42))
```

## Author

Vladimir Konev, [KoNEW](https://github.com/KoNEW)

## License

SwiftyDefaults is available under the MIT license. See the LICENSE file for more info.

## Original source

Based on fork of [SwiftDefaults](https://github.com/shimesaba9/SwiftDefaults) due to lack of response to Pull Requests

## For contributors

Need help with proper configuration of Travis CI - you are welcome to send pull request. 
