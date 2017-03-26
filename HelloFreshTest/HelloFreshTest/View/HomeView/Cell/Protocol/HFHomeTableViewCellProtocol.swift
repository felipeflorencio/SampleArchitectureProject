//
//  HFHomeTableViewCellProtocol.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/26/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

protocol HFHomeTableViewCellProtocol: class {
    func selectedFavoriteFood(item positionItem: Int, status favoritedStatus: Bool)
}
