//
//  HFSystemUtilities.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/27/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

extension NSObject {
    
    func weLogin() -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        return appDelegate.weAreConnected!
    }
    
    func setLoginStatus(status loginStatus: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.weAreConnected = loginStatus
    }
    
}
