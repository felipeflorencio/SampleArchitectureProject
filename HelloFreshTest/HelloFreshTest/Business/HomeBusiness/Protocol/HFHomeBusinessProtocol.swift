//
//  HFHomeBusinessProtocol.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/25/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

typealias DataResponse = (_ responseObject: Array<HFHomeModel>?, _ error: ErrorResponseProtocol?) -> Void

protocol HFHomeBusinessProtocol {
    func requestHomeData(response dataResponse: @escaping DataResponse)
}
