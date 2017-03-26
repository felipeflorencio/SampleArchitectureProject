//
//  HSParseDataError.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

extension NetworkErrorResponse {
    enum HSParseDataError: Error, ErrorResponseProtocol {
        case invalidVariableMapping(String)
        case failedMappingData
        
        var description: String{
            switch self {
            case .invalidVariableMapping(let variable): return "Invalid Variable Mapping: \(variable)"
            case .failedMappingData: return "Failed mapping data"
            }
        }
    }
}
