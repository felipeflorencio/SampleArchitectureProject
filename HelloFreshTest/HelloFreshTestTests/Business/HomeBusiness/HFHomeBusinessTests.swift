//
//  HFHomeBusinessTests.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/29/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import XCTest
@testable import HelloFreshTest

class HFHomeBusinessTests: XCTestCase {
    
    let homeBusiness = HFHomeBusiness()
    
    
    func testRequestHomeData() {

        let expect = expectation(description: "validate if we will have return")
        
        homeBusiness.requestHomeData { (dataModel, error) in
            
            if error == nil {
                
                guard let data = dataModel else {
                    XCTFail("failed unwrap data")
                    return
                }
                
                if data is Array<HFHomeModel> {
                    XCTAssertTrue(true)
                }
            }
            
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 3) { (error) in
            if error != nil {
                XCTFail("Failed get data")
            }
        }
    
    }
    
    func testRequestDataAndValidateIfFail() {
        
        let expect = expectation(description: "validate if we return a error")

        self.requestHomeData { (responseData, errorType) in
            
            if errorType != nil {
                
                switch (errorType as! NetworkErrorResponse) {
                    case .invalidResponse: XCTAssertTrue(true)
                    default: XCTFail("Failed type of error is wrong")
                }
                
                XCTAssertTrue(true)
            } else{
                XCTFail("Failed validate error")
            }
            
            expect.fulfill()

        }
        
        waitForExpectations(timeout: 3) { (error) in
            if error != nil {
                XCTFail("Failed validate error")
            }
        }
        
    }

    
}

// Here we could create a new mock class that use our protocol so we could create a lot 
// of models to test different scenarios
extension HFHomeBusinessTests: HFHomeBusinessProtocol {
    
    func requestHomeData(response dataResponse: @escaping DataResponse) {
        let provider = HFHomeProvider()
        
        let networkRequest = HFNetworkRequest(method: .GET, url: "", bodyParameters: nil, headerParameter: nil)
        
        provider.request(networkRequest) { (data, error) in
            dataResponse(nil, NetworkErrorResponse.invalidResponse)
        }
        
        
    }
    
}
