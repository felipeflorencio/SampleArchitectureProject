//
//  HFHomeTableViewCell.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/25/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodKeyword: UILabel!
    @IBOutlet weak var foodRate: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func favoriteButton(_ sender: Any) {
    
    }
}
