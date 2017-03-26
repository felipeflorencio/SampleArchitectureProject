//
//  HFHomeModel.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

struct HFHomeModel {
    
    let calories: String
    let carbos: String
    let card: String
    let country: String
    let deliverable_ingredients: Array<String>
    let descriptionData: String
    let difficulty: Int
    let fats: String
    let favorites: Int
    let fibers: String
    let headline: String
    let highlighted: Bool
    let idData: String
    let image: String
    let ingredients: Array<String>
    let keywords: Array<String>
    let name: String
    let products: Array<String>
    let proteins: String
    let rating: Double
    let ratings: Double
    let thumb: String
    let time: String
    let undeliverable_ingredients: Array<Any>
    let user: HFHomeUserModel
    let weeks: Array<String>
    
}

extension HFHomeModel {
    
    static func parseToListOfHFHomeModelList(data jsonData: Array<Dictionary<String, Any>>) throws -> Array<HFHomeModel> {
        
        var listOfParsedData = Array<HFHomeModel>()
        
        for dataObject in jsonData {
        
            guard let calories = dataObject["calories"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("calories")
            }
            
            guard let carbos = dataObject["carbos"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("carbos")
            }
            
            guard let card = dataObject["card"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("card")
            }
            
            guard let country = dataObject["country"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("country")
            }
            
            guard let deliverable_ingredients = dataObject["deliverable_ingredients"] as? Array<String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("deliverable_ingredients")
            }
            
            guard let descriptionData = dataObject["description"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("description")
            }
            
            guard let difficulty = dataObject["difficulty"] as? Int else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("difficulty")
            }
            
            guard let fats = dataObject["fats"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("fats")
            }
            
            guard let favorites = dataObject["favorites"] as? Int else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("favorites")
            }
            
            guard let fibers = dataObject["fibers"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("fibers")
            }
            
            guard let headline = dataObject["headline"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("headline")
            }
            
            guard let highlighted = dataObject["highlighted"] as? Bool else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("highlighted")
            }
            
            guard let idData = dataObject["id"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("id")
            }
            
            guard let image = dataObject["image"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("image")
            }
            
            guard let ingredients = dataObject["ingredients"] as? Array<String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("ingredients")
            }

            guard let keywords = dataObject["keywords"] as? Array<String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("keywords")
            }

            guard let name = dataObject["name"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("name")
            }

            guard let products = dataObject["products"] as? Array<String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("products")
            }

            guard let proteins = dataObject["proteins"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("proteins")
            }

            // Here it's a sample of a kind of validation, we can handle how we want
            // depend of the rule from our API, in this case the value can be null or
            // nil so we just validate if is null, if yes we set a value, next if not nil
            // we need validate if is a Double if not so we throw a exception
            var rating = dataObject["rating"] as? Double
            if rating == nil {
                rating = 0
            } else {
                guard let ratingData = dataObject["rating"] as? Double else {
                    throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("rating")
                }
                
                rating = ratingData
            }
            
            // Here it's a sample of a kind of validation, we can handle how we want
            // depend of the rule from our API, in this case the value can be null or
            // nil so we just validate if is null, if yes we set a value, next if not nil
            // we need validate if is a Double if not so we throw a exception
            var ratings = dataObject["ratings"] as? Double
            if ratings == nil {
                ratings = 0
            } else {
                guard let ratingsData = dataObject["ratings"] as? Double else {
                    throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("ratings")
                }
                
                ratings = ratingsData
            }
            
            guard let thumb = dataObject["thumb"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("thumb")
            }
            
            guard let time = dataObject["time"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("time")
            }
            
            // As i don't know what kind of data is this array i set as Any
            guard let undeliverable_ingredients = dataObject["undeliverable_ingredients"] as? Array<Any> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("undeliverable_ingredients")
            }
            
            guard let userDict = dataObject["user"] as? Dictionary<String, String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("user")
            }
            
            let user = try HFHomeUserModel.parseToHFHomeUserModel(data: userDict)

            guard let weeks = dataObject["weeks"] as? Array<String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("weeks")
            }


            let homeModel = HFHomeModel(calories: calories, carbos: carbos, card: card, country: country, deliverable_ingredients: deliverable_ingredients, descriptionData: descriptionData, difficulty: difficulty, fats: fats, favorites: favorites, fibers: fibers, headline: headline, highlighted: highlighted, idData: idData, image: image, ingredients: ingredients, keywords: keywords, name: name, products: products, proteins: proteins, rating: rating!, ratings: ratings!, thumb: thumb, time: time, undeliverable_ingredients: undeliverable_ingredients, user: user, weeks: weeks)
            
            listOfParsedData.append(homeModel)
        }
        
        return listOfParsedData
    }
    
}
