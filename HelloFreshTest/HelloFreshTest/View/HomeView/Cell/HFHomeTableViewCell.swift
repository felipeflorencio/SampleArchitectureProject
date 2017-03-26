//
//  HFHomeTableViewCell.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/25/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import SDWebImage

class HFHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodKeyword: UILabel!
    @IBOutlet weak var foodRate: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func favoriteButton(_ sender: Any) {
    
    }
    
    func fillFoodCellWithData(data object: HFHomeModel) -> Void {
        
        // Configure and load/request the image from server
        self.foodImage.sd_setShowActivityIndicatorView(true)
        self.foodImage.sd_setIndicatorStyle(.whiteLarge)
        self.foodImage.sd_setImage(with: URL(string: object.image), placeholderImage: UIImage(named: "food_placeholder"))
        
        self.foodName.text = object.name
        var keyword = ""
        for (pos, key) in object.keywords.enumerated() {
            keyword.append(key)
            if pos < object.keywords.count {
                keyword.append(" ・ ")
            }
        }
        
        self.foodKeyword.text = keyword
        
    }
}
