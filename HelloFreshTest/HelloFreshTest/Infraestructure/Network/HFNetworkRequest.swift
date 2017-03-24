//
//  HFNetworkRequest.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

struct HFNetworkRequest: HFNetworkRequestConfigProtocol {
    
    var method: RequestType
    var url: String
    var bodyParameters: [String:AnyObject]?
    var headerParameter: [String:String]?
    
    func networkRequest() throws -> URLRequest {
        guard let url = URL(string: self.url) else { throw NetworkRequestError.invalidURL(self.url)}
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 120)
        request.httpMethod = self.method.rawValue
        
        if let parameters = bodyParameters {
            do {
                let postData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = postData
            } catch {
                throw NetworkRequestError.invalidParameters(parameters)
            }
        }
        
        if let parameters = headerParameter {
            for (headerField, value) in parameters {
                request.addValue(value, forHTTPHeaderField: headerField)
            }
        }
        
        return request
    }
    
}
