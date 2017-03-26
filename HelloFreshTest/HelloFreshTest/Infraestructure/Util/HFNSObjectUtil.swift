//
//  HFNSObjectUtil.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/25/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

extension NSObject {
    
    func delay(_ delay: Double, closure: @escaping () -> ()) {
        
        let when = DispatchTime.now() + delay
        
        DispatchQueue.main.asyncAfter(deadline: when,
                                      execute: closure)
    }
    
}
