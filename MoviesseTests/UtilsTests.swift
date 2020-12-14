//
//  UtilsTests.swift
//  MoviesseTests
//
//  Created by Stevhen on 14/12/20.
//

import XCTest
@testable import Moviesse

class UtilsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDateFormatter() throws {
        
        let dateString = Utils.dateFormatter("2020-12-14")
        let result = dateString == "Dec 14, 2020"
        
        XCTAssertEqual(result, true)
    }
    
    func testDateFormatterFailDecode() throws {

        let dateString = Utils.dateFormatter("14 12 2020")
        let result = dateString == "There was an error decoding the string"
        
        XCTAssertEqual(result, true)
    }
    
    func testDateFormatterDateOrigin() throws {
        
        let dateString = Utils.dateFormatterDateOrigin("2020-12-14T11:01:31.772Z")
        let result = dateString == "Dec 14, 2020"
        
        XCTAssertEqual(result, true)
    }
    
    func testDateFormatterDateOriginFailDecode() throws {

        let dateString = Utils.dateFormatterDateOrigin("14 12 2020")
        let result = dateString == "There was an error decoding the string"
        
        XCTAssertEqual(result, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
