//
//  Fuzzywuzzy_swiftTests.swift
//  Fuzzywuzzy_swiftTests
//
//  Created by XianLi on 30/8/2016.
//  Copyright © 2016 LiXian. All rights reserved.
//

import XCTest
@testable import Fuzzywuzzy_swift

class Fuzzywuzzy_swiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTokenSetRatio() {
        let strPairs = [("some", ""), ("", "some"), ("", ""), ("fuzzy fuzzy wuzzy was a bear", "wuzzy fuzzy was a bear"), ("fuzzy$*#&)$#(wuzzy*@()#*()!<><>was a bear", "wuzzy wuzzy fuzzy was a bear")]
        for (str1, str2) in strPairs {
            print("STR1: \(str1)")
            print("STR2: \(str2)")
            print("TOKEN SET RATIO: \(String.fuzzTokenSetRatio(str1: str1, str2: str2))")
            print("-----------------")
        }
    }
    
    func testTokenSortRatio() {
        let strPairs = [("some", ""), ("", "some"), ("", ""), ("fuzzy wuzzy was a bear", "wuzzy fuzzy was a bear"), ("fuzzy$*#&)$#(wuzzy*@()#*()!<><>was a bear", "wuzzy fuzzy was a bear")]
        for (str1, str2) in strPairs {
            print("STR1: \(str1)")
            print("STR2: \(str2)")
            print("TOKEN SORT RATIO: \(String.fuzzTokenSortRatio(str1: str1, str2: str2))")
            print("-----------------")
        }
    }
    
    func testPartialRatio() {
        let strPairs = [("some", ""), ("", "some"), ("", ""), ("abcd", "XXXbcdeEEE"), ("what a wonderful 世界", "wonderful 世"), ("this is a test", "this is a test!")]
        for (str1, str2) in strPairs {
            print("STR1: \(str1)")
            print("STR2: \(str2)")
            print("PARTIO RATIO: \(String.fuzzPartialRatio(str1: str1, str2: str2))")
            print("-----------------")
        }
    }
    
    func testCommonSubstrings() {
        let strPairs = [("some", ""), ("", "some"), ("", ""), ("aaabbcde", "abbdbcdaabde"), ("abcdef", "abcdef")]
        for (str1, str2) in strPairs {
            let pairs = CommonSubstrings.pairs(str1: str1, str2: str2)
            print("STR1: \(str1)")
            print("STR2: \(str2)")
            for pair in pairs {
                print("\(str1.substringWithRange(pair.str1SubRange))")
                print("\(str2.substringWithRange(pair.str2SubRange))")
                print("")
            }
            print("-----------------")
        }
    }
    
    func testStringMatcher() {
        let strPairs = [("some", ""), ("", "some"), ("", ""), ("我好hungry", "我好饿啊啊啊啊"), ("我好饿啊啊啊啊", "好烦啊")]
        for (str1, str2) in strPairs {
            let matcher = StringMatcher(str1: str1, str2: str2)
            let ratio = matcher.fuzzRatio()
            XCTAssert(ratio <= 1 && ratio >= 0)
            print("STR1: \(str1)")
            print("STR2: \(str2)")
            print("RATIO: \(ratio)")
            print("-----------------")
        }
    }
    
    func testLevenshteinDistance() {
        XCTAssert(LevenshteinDistance.distance(str1: "something", str2: "some") == 5)
        
        XCTAssert(LevenshteinDistance.distance(str1: "something", str2: "omethi") == 3)
        
        XCTAssert(LevenshteinDistance.distance(str1: "something", str2: "same") == 6)
        
        XCTAssert(LevenshteinDistance.distance(str1: "something", str2: "samewrongthong") == 7)
        
        XCTAssert(LevenshteinDistance.distance(str1: "something", str2: "") == 9)
        
        XCTAssert(LevenshteinDistance.distance(str1: "", str2: "some") == 4)
        
        XCTAssert(LevenshteinDistance.distance(str1: "some", str2: "some") == 0)
        
        XCTAssert(LevenshteinDistance.distance(str1: "", str2: "") == 0)
        
        XCTAssert(LevenshteinDistance.distance(str1: "我something", str2: "someth") == 4)
        
        XCTAssert(LevenshteinDistance.distance(str1: "我好饿啊啊啊啊", str2: "好烦啊") == 5)
        
    }
}
