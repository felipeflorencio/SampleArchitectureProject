//
//  HFDataFileReader.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

class HFDataFileReader: NSObject {
    
    class func loadJsonData(filename fileName: String = "recipes") throws -> Data {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                throw NetworkErrorResponse.ParseResponseFailed.jsonParseFailed
            }
        
        }
        
        throw NetworkErrorResponse.ParseResponseFailed.parseErrorMsg("Some localized Error Message")
    }
    
    
}
