//
//  StringMatcher.swift
//  Fuzzywuzzy_swift
//
//  Created by XianLi on 30/8/2016.
//  Copyright © 2016 LiXian. All rights reserved.
//

import UIKit

class StringMatcher: NSObject {
    let str1: String
    let str2: String

    lazy var levenshteinDistance: Int = LevenshteinDistance.distance(str1: self.str1, str2: self.str2)
    lazy var commonSubStringPairs: [CommonSubstringPair] = CommonSubstrings.pairs(str1: self.str1, str2: self.str2)

    init(str1: String, str2: String) {
        self.str1 = str1
        self.str2 = str2
        super.init()
    }

    func fuzzRatio() -> Float {
        let lenSum = (str1.count + str2.count)
        if lenSum == 0 { return 1 }
        return Float(lenSum - levenshteinDistance) / Float(lenSum)
    }


}

