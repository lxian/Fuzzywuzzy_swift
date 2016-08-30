//
//  CommonSubstrings.swift
//  Fuzzywuzzy_swift
//
//  Created by XianLi on 30/8/2016.
//  Copyright © 2016 LiXian. All rights reserved.
//

import UIKit

struct CommonSubstringPair {
    let str1SubRange: Range<String.Index>
    let str2SubRange: Range<String.Index>
    let len: Int
}

class CommonSubstrings: NSObject {
    /// get all pairs of common substrings
    class func pairs(str1 str1: String, str2: String) -> [CommonSubstringPair] {
        /// convert String to array of Characters
        let charArr1 = Array(str1.characters)
        let charArr2 = Array(str2.characters)
        
        if charArr1.count == 0 || charArr2.count == 0 {
            return []
        }
        
        /// create the matching matrix
        var matchingM = Array(count: charArr1.count+1, repeatedValue: Array(count: charArr2.count+1, repeatedValue: 0))
        
        for i in Array(1...charArr1.count) {
            for j in Array(1...charArr2.count) {
                if charArr1[i-1] == charArr2[j-1] {
                    matchingM[i][j] = matchingM[i-1][j-1] + 1
                } else {
                    matchingM[i][j] = 0
                }
            }
        }
        
        var pairs: [CommonSubstringPair] = []
        for i in Array(1...charArr1.count) {
            for j in Array(1...charArr2.count) {
                if matchingM[i][j] == 1 {
                    var len = 1
                    while (i+len) < (charArr1.count + 1)
                        && (j + len) < (charArr2.count + 1)
                        && matchingM[i+len][j+len] != 0 {
                            len += 1
                    }
                    
                    let sub1Range = Range(str1.startIndex.advancedBy(i-1)...str1.startIndex.advancedBy(i-1+len-1))
                    let sub2Range = Range(str2.startIndex.advancedBy(j-1)...str2.startIndex.advancedBy(j-1+len-1))
                    pairs.append(CommonSubstringPair.init(str1SubRange: sub1Range, str2SubRange: sub2Range, len: len))
                }
            }
        }
        return pairs
    }
}
