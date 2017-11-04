//
//  BenchmarkTests.swift
//  BenchmarkTests
//
//  Created by Meiliang Dong on 03/11/2017.
//  Copyright © 2017 Meiliang Dong. All rights reserved.
//

import XCTest
@testable import Benchmark

class BenchmarkTests: XCTestCase {
    
//    var A = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]
    var A = [13, -3, -25, 20, -3, -16, -23, 18, 20]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForcePerformance() {
        self.measure {
            let (_, _, _) = FORCE_FIND_MAX_SUBARRAY(A: A)
        }
    }
    
    func testRecusivePerformance() {
        self.measure {
            let (_, _, _) = FIND_MAXIMUM_SUBARRAY(A: A, low: 0, high: A.count - 1)
        }
    }
}
