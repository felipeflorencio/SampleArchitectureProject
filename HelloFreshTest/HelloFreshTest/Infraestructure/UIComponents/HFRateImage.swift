//
//  HFRateImage.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/26/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRateForFood(rate numberOfRate: Double) -> Void {
        
        var temporaryImage: UIImage
        
        switch numberOfRate {
            case 1 where numberOfRate <= 1:
                temporaryImage = UIImage(named: "rating_star_1")!
                break
            case 2 where numberOfRate <= 2:
                temporaryImage = UIImage(named: "rating_star_2")!
                break
            case 3 where numberOfRate <= 3:
                temporaryImage = UIImage(named: "rating_star_3")!
                break
            case 4 where numberOfRate <= 4:
                temporaryImage = UIImage(named: "rating_star_4")!
                break
            case 5 where numberOfRate <= 5:
                temporaryImage = UIImage(named: "rating_star_5")!
                break
            default:
                temporaryImage = UIImage(named: "rating_star_0")!
                break
        }
        
        
        self.image = temporaryImage
    }
    
}
