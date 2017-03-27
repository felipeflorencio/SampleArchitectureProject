//
//  HFDeviceOrientationUtil.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/26/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFDeviceOrientationUtil: NSObject {
 
    static func getRowSizeByDeviceOrientationPosition() -> CGFloat {
        
        var rowSize: CGFloat = 0
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            if UIDevice.current.userInterfaceIdiom == .phone {
                rowSize = 340
            } else {
                rowSize = 600
            }
        } else {
            if UIDevice.current.userInterfaceIdiom == .phone {
                rowSize = 480
            } else {
                rowSize = 780
            }
        }
        
        return rowSize
    }
    
}
