# Fuzzywuzzy_swift (WIP)
Fuzzy String Matching in Swift using Levenshtein Distance. Inspired by the python fuzzywuzzy library https://github.com/seatgeek/fuzzywuzzy

It has no external dependancies. And thanks to Swift String, it can support multi-lingual.

**WARNING: This library is still WORKING IN PROGRESS.**

# Installation
### Carthage
Add the following line to your Cartfile. And run `carthage update`
```
github "lxian/Fuzzywuzzy_swift"
```
### Cocoapod
Add the following line to your Podfile. And run `pod install`
```
pod 'Fuzzywuzzy_swift', :git=> 'https://github.com/lxian/Fuzzywuzzy_swift.git'
```
### Manually
drag the `Fuzzywuzzy_swift` folder into your project

# Usage
```swift
import Fuzzywuzzy_swift
```
### Simple Ratio
```swift
String.fuzzRatio(str1: "some text here", str2: "same text here!") // => 93
```

### Partial Ratio
Partial Ratio tries to match the shoter string to a substring of the longer one
```swift
String.fuzzPartialRatio(str1: "some text here", str2: "I found some text here!") // => 100
```
