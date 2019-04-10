//
//  LevenshteinDistance.swift
//  Fuzzywuzzy_swift
//
//  Created by XianLi on 30/8/2016.
//  Copyright © 2016 LiXian. All rights reserved.
//

import UIKit

class LevenshteinDistance: NSObject {
    class func distance(str1: String, str2: String) -> Int {
        /// convert String to array of Characters
        let charArr1 = Array(str1)
        let charArr2 = Array(str2)

        /// handle empty string cases
        if charArr1.count == 0 || charArr2.count == 0 {
            return charArr1.count + charArr2.count
        }

        /// create the cost matrix
        var costM = Array(repeating: Array(repeating: 0, count: charArr2.count+1), count: charArr1.count+1)

        /// initial values in cost matrix
        for i in Array(0...charArr2.count) {
            costM[0][i] = i
        }

        for i in Array(0...charArr1.count) {
            costM[i][0] = i
        }

        for i in Array(1...charArr1.count) {
            for j in Array(1...charArr2.count) {
                let cost1 = costM[i-1][j-1] + (charArr1[i-1] == charArr2[j-1] ? 0 : 1)
                let cost2 = costM[i][j-1] + 1
                let cost3 = costM[i-1][j] + 1
                costM[i][j] = min(cost1, cost2, cost3)
            }
        }

        return costM[charArr1.count][charArr2.count]
    }
}

