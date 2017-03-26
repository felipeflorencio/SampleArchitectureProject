//
//  UIView+VisualUtil.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/26/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(color shadowColor: UIColor = UIColor.darkGray, opacity shadowOpacity: Float = 1, radius shadowRadius: CGFloat = 10) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRadius
        self.layer.shouldRasterize = true
    }
    
}
