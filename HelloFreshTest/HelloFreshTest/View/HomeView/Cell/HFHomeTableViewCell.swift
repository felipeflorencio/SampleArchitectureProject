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
    
    @IBOutlet weak var windowView: UIView!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodKeyword: UILabel!
    @IBOutlet weak var foodRate: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var homeViewCellDelegate: HFHomeTableViewCellProtocol?
    
    private var rowPosition: Int = 0
    private var temporaryObjectReference: HFHomeModel?
    
    override func awakeFromNib() {
        self.windowView.addShadow()
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        
        guard let object = self.temporaryObjectReference else { return }
        
        var statusFavorite = true
        var imageStatus = UIImage(named: "favorite_heart_on")
        if object.userFavorited {
            statusFavorite = false
            imageStatus = UIImage(named: "favorite_heart_off")
        }
        
        
        self.favoriteButton.setImage(imageStatus, for: .normal)
        homeViewCellDelegate?.selectedFavoriteFood(item: self.rowPosition, status: statusFavorite)
    }
    
    func fillFoodCellWithData(data object: HFHomeModel, index positionRow: Int) -> Void {
        
        self.rowPosition = positionRow
        self.temporaryObjectReference = object
        
        // Configure and load/request the image from server
        self.foodImage.sd_setShowActivityIndicatorView(true)
        self.foodImage.sd_setIndicatorStyle(.whiteLarge)
        self.foodImage.sd_setImage(with: URL(string: object.image), placeholderImage: UIImage(named: "food_placeholder"))
        
        self.foodName.text = object.name
        var keyword = ""
        for (pos, key) in object.keywords.enumerated() {
            keyword.append(key)
            if (pos + 1) < object.keywords.count {
                keyword.append(" ・ ")
            }
        }
        
        self.foodKeyword.text = keyword
        
        var imageStatus = UIImage(named: "favorite_heart_on")
        if !object.userFavorited {
            imageStatus = UIImage(named: "favorite_heart_off")
        }
        
        self.foodRate.setRateForFood(rate: object.rating)
        
        self.favoriteButton.setImage(imageStatus, for: .normal)

    }
}
