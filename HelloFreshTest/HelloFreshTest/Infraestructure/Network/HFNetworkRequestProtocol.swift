//
//  HFNetworkRequestProtocol.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

typealias ResquestResponse = (_ data: Data?, _ error: NetworkErrorResponse?) -> Void

protocol HFNetworkProtocolAPI {
    func request(_ request: HFNetworkRequestConfigProtocol, responseStatus: @escaping ResquestResponse)
}
