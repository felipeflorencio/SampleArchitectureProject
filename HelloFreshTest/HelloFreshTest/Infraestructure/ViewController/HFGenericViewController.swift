//
//  HFGenericViewController.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/27/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFGenericViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !weLogin() {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: String(describing: HFLoginViewController.self)) as! HFLoginViewController
            
            if self.presentingViewController?.isKind(of: HFLoginViewController.self) == nil {
                self.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
}
