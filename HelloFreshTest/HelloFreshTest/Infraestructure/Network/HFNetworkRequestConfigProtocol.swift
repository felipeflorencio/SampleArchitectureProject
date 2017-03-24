//
//  HFNetworkRequestConfigProtocol.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

// Its just add more type here ex PUT DELETE
enum RequestType: String {
    case GET    = "GET"
    case POST   = "POST"
}

protocol HFNetworkRequestConfigProtocol {

    //MARK: - Public Properties
    var method: RequestType {get set}
    var url: String {get set}
    var bodyParameters: [String:AnyObject]? {get set}
    var headerParameter: [String:String]? {get set}
    
    func networkRequest() throws -> URLRequest

}
