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
