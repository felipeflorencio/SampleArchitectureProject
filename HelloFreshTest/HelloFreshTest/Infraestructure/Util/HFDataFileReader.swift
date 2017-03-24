//
//  HFDataFileReader.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

class HFDataFileReader: NSObject {
    
    class func loadJson(filename fileName: String = "recipes") -> Dictionary<String, AnyObject>? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: url)
                let object = try data.fromJSON()
                if let dictionary = object as? [String: AnyObject] {
                    return dictionary
                }
            } catch {
                debugPrint("Error!! Unable to parse  \(fileName).json")
            }
        
            debugPrint("Error!! Unable to load  \(fileName).json")
        }
        return nil
    }
    
}
