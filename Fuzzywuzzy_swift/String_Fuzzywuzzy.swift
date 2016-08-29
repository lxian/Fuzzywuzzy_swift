//
//  String_Fuzzywuzzy.swift
//  Fuzzywuzzy_swift
//
//  Created by XianLi on 30/8/2016.
//  Copyright © 2016 LiXian. All rights reserved.
//

import UIKit

extension String {
    /// Basic Scoring Functions
    static func ratio(str1 str1: String, str2: String) -> Int {
        let m = StringMatcher(str1: str1, str2: str2)
        return Int(m.ratio() * 100)
    }
}
