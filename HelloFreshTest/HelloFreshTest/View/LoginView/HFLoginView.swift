//
//  HFLoginView.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/26/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFLoginView: UIView {
 
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewInsideScroll: UIView!
    @IBOutlet weak var txtEmailTextField: UITextField!
    @IBOutlet weak var txtPasswordTextField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    weak var loginViewDelegate: HFLoginViewProtocol?

    
    @IBAction func loginButton(_ sender: Any) {
        self.loginViewDelegate?.performLogin()
    }
    
}
