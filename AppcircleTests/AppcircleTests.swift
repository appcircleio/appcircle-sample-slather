//
//  AppcircleTests.swift
//  AppcircleTests
//
//  Created by Mustafa on 29.12.2021.
//

import XCTest
@testable import Appcircle

class AppcircleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSkip() throws {
        let isAppcircle = ProcessInfo.processInfo.environment["AC_APPCIRCLE"]
        try XCTSkipIf(isAppcircle == "true", "Skip this test on Appcircle")
        XCTAssertTrue(true,"Local test")
    }
    
    func testExpectedFailure() throws {
        let thingThatFails: Bool = false
        XCTExpectFailure("Working on a fix for this problem.")
        XCTAssertTrue(thingThatFails, "This is not working right now.")
    }
        
    func testPass() throws {
        XCTAssertTrue(true, "This test should pass")
    }
    
    func testFail() throws {
        XCTAssertTrue(false,"This test should fail")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
