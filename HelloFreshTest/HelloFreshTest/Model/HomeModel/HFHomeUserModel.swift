//
//  HFHomeUserModel.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

struct HFHomeUserModel {
    
    let email: String
    let latlng: String
    let name: String
    
}

extension HFHomeUserModel {
    
    static func parseToHFHomeUserModel(data objectJson: Dictionary<String, String>) throws -> HFHomeUserModel {
        
        guard let email = objectJson["email"] else {
            throw HSParseDataError.invalidVariableMapping("email")
        }
        
        guard let latlng = objectJson["latlng"] else {
            throw HSParseDataError.invalidVariableMapping("latlng")
        }
        
        guard let name = objectJson["name"] else {
            throw HSParseDataError.invalidVariableMapping("name")
        }
        
        return HFHomeUserModel(email: email, latlng: latlng, name: name)
    }
    
}
