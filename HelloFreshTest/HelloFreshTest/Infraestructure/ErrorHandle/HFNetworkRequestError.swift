//
//  HFNetworkRequestError.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

enum HFNetworkRequestError: Error, CustomStringConvertible {
    case invalidURL(String)
    case invalidParameters([String:AnyObject])
    
    var description: String{
        switch self {
        case .invalidURL(let url): return "The URL \'\(url)\' is invalid"
        case .invalidParameters(let parameters): return "The parameters \'\(parameters)\' that you provided are wrong"
        }
    }
}

// MARK: - ErrorResponse Enum
protocol ErrorResponseProtocol { var description: String { get } }

enum NetworkErrorResponse: Error, ErrorResponseProtocol {
    case unknown(String)
    case invalidResponse
    
    var description: String{
        switch self {
        case .unknown(let error): return "An unknown error occurred: \(error)"
        case .invalidResponse: return "Received an Invalid response"
        }
    }
}

extension NetworkErrorResponse {
    
    enum ParseResponseFailed: Error, ErrorResponseProtocol {
        case parseErrorMsg(String)
        case jsonParseFailed
        
        var description: String{
            switch self {
            case .parseErrorMsg(let error): return "Failed while trying parse: \(error)"
            case .jsonParseFailed: return "Parse failed"
            }
        }
    }
}
