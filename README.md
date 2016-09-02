# Fuzzywuzzy_swift
Fuzzy String Matching in Swift using Levenshtein Distance. Ported from the python fuzzywuzzy library https://github.com/seatgeek/fuzzywuzzy

It has no external dependancies. And thanks to Swift String, it can support multi-language.

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
### Token Sort Ratio
Split strings by white space into arrays of tokens. Sort two arrays of Tokens. Calculate the effort needed to transform on arry of token into another. Characters other than letters and numbers are removed as a pre-processing by default.
```swift
String.fuzzTokenSortRatio(str1: "fuzzy wuzzy was a bear", str2: "wuzzy fuzzy was a bear") // => 100

String.fuzzTokenSortRatio(str1: "fuzzy+wuzzy(was) a bear", str2: "wuzzy fuzzy was a bear") // => 100
```
set fullProcess to false to remove this pre-processing
```swift
String.fuzzTokenSortRatio(str1: "fuzzy+wuzzy(was) a bear", str2: "wuzzy fuzzy was a bear", fullProcess: false) // => 77
```
### Token Set Ratio
Similiar to token sort ratio while it put tokens into a set trying to remove duplicated tokens.
```swift
String.fuzzTokenSortRatio(str1: "fuzzy was a bear", str2: "fuzzy fuzzy was a bear") // => 84

String.fuzzTokenSetRatio(str1: "fuzzy was a bear", str2: "fuzzy fuzzy was a bear") // => 100
```

