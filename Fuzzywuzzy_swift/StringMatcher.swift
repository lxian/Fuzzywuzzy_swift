//
//  StringMatcher.swift
//  Fuzzywuzzy_swift
//
//  Created by XianLi on 30/8/2016.
//  Copyright © 2016 LiXian. All rights reserved.
//

import UIKit

public class StringMatcher: NSObject {
    let str1: String
    let str2: String
    
    public lazy var levenshteinDistance: Int = LevenshteinDistance.distance(str1: self.str1, str2: self.str2)
    public lazy var commonSubStringPairs: [CommonSubstringPair] = CommonSubstrings.pairs(str1: self.str1, str2: self.str2)
    
    public init(str1: String, str2: String) {
        self.str1 = str1
        self.str2 = str2
        super.init()
    }
    
    public func ratio() -> Float {
        let lenSum = (str1.characters.count + str2.characters.count)
        if lenSum == 0 { return 1 }
        return Float(lenSum - levenshteinDistance) / Float(lenSum)
    }
    
    
}
