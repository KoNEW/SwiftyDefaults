#
# Be sure to run `pod lib lint SwiftyDefaults.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwiftyDefaults"
  s.version          = "1.1.0"
  s.summary          = "SwiftyDefaults provides accessing to NSUserDefaults using property."
  s.description      = <<-DESC
SwiftyDefaults provides accessing to NSUserDefaults using property.

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
DESC

  s.homepage         = "https://github.com/KoNEW/SwiftyDefaults"
  s.license          = 'MIT'
  s.author           = { "Vladimir Konev" => "konev.vn@gmail.com" }
  s.source           = { :git => "https://github.com/KoNEW/SwiftyDefaults.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
end
