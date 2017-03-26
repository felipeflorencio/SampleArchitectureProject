//
//  HFHomeManager.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

class HFHomeManager: NSObject, HFHomeBusinessProtocol {
    
    private let homeBusiness = HFHomeBusiness()
    
    func requestHomeData(response dataResponse: @escaping DataResponse) {
        homeBusiness.requestHomeData(response: dataResponse)
    }
    
}
