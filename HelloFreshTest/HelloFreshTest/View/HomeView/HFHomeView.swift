//
//  HFHomeView.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFHomeView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func failedInMakeRequest(controller: UIViewController){
        let alert = UIAlertController(title: "Failed get List",
                                      message: "Something had happened, and the data can not being processed please try again", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        controller.present(alert, animated: true, completion: nil)
    }
    
}
