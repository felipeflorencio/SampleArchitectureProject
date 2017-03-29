//
//  HFDataFileReaderTests.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/28/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import XCTest
@testable import HelloFreshTest


class HFDataFileReaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testIfWeGetData() {
        do {
            let _ = try HFDataFileReader.loadJsonData(filename: "recipes")
            
            XCTAssertTrue(true)
        } catch {
            XCTFail("Failed getting our data our data")
        }
        
    }
    
    func testIfWeSetInvalidDataWeFail() {
        do {
            let _ = try HFDataFileReader.loadJsonData(filename: "recipe")
            
            
            XCTFail("Failed, the data name is invalid or method is not working right")
        } catch {
            XCTAssertTrue(true, "We set invalid file and failed right")
        }
        
    }
    

    
}
