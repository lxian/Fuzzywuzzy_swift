//
//  StringProcessor.swift
//  Fuzzywuzzy_swift
//
//  Created by XianLi on 31/8/2016.
//  Copyright © 2016 LiXian. All rights reserved.
//

import UIKit

class StringProcessor: NSObject {
    /// Process string by
    /// removing all but letters and numbers
    /// trim whitespace
    /// force to lower case
    class func process(str: String) -> String {
        /// lower case
        var str = str.lowercased()

        /// replace other charcters in to white space
        let regex = try! NSRegularExpression(pattern: "\\W+",
                                             options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, str.count)
        str = regex.stringByReplacingMatches(in: str,
                                             options: [],
                                             range: range,
                                             withTemplate: " ")
        str = str.trimmingCharacters(in: NSCharacterSet.init(charactersIn: " ") as CharacterSet)

        return str
    }
}

