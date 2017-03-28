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
    
    
    func isValidEmail(textStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: textStr)
    }
    
    func isValidPassword(textStr:String) -> Bool {
        
        if textStr.characters.count < 5 {
            return false
        }
        return true
    }
    
}
