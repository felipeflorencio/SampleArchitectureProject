//
//  NSData+HelperExtension.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

extension Data {
    func fromJSON(_ options:JSONSerialization.ReadingOptions = .allowFragments) throws -> Any? {
        return try JSONSerialization.jsonObject(with: self, options: options)
    }
}
