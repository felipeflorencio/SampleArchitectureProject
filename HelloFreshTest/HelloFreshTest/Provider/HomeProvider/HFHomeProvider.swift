//
//  HFHomeProvider.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

class HFHomeProvider: NSObject {
 
    
    func request(_ request: HFNetworkRequest, responseStatus: @escaping ResquestResponse) {
        
        do {
            let data = try HFDataFileReader.loadJsonData()
            delay(3, closure: {
                responseStatus(data, nil)
            })
        } catch {
            responseStatus(nil, NetworkErrorResponse.unknown(error.localizedDescription))
        }
    
    }
    
}
