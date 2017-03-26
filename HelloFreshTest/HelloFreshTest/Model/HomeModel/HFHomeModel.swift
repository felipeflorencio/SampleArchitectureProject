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
    let highlighted: String
    let idData: String
    let image: String
    let incompatibilities: String
    let ingredients: Array<String>
    let keywords: Array<String>
    let name: String
    let products: Array<String>
    let proteins: String
    let rating: String
    let ratings: String
    let thumb: String
    let time: String
    let undeliverable_ingredients: String
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
            
            guard let highlighted = dataObject["highlighted"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("highlighted")
            }
            
            guard let idData = dataObject["id"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("id")
            }
            
            guard let image = dataObject["image"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("image")
            }
            
            guard let incompatibilities = dataObject["incompatibilities"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("incompatibilities")
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

            guard let rating = dataObject["rating"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("rating")
            }
            
            guard let ratings = dataObject["ratings"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("ratings")
            }
            
            guard let thumb = dataObject["thumb"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("thumb")
            }
            
            guard let time = dataObject["time"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("time")
            }
            
            guard let undeliverable_ingredients = dataObject["undeliverable_ingredients"] as? String else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("undeliverable_ingredients")
            }
            
            guard let userDict = dataObject["user"] as? Dictionary<String, String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("user")
            }
            
            let user = try HFHomeUserModel.parseToHFHomeUserModel(data: userDict)

            guard let weeks = dataObject["weeks"] as? Array<String> else {
                throw NetworkErrorResponse.HSParseDataError.invalidVariableMapping("weeks")
            }


            let homeModel = HFHomeModel(calories: calories, carbos: carbos, card: card, country: country, deliverable_ingredients: deliverable_ingredients, descriptionData: descriptionData, difficulty: difficulty, fats: fats, favorites: favorites, fibers: fibers, headline: headline, highlighted: highlighted, idData: idData, image: image, incompatibilities: incompatibilities, ingredients: ingredients, keywords: keywords, name: name, products: products, proteins: proteins, rating: rating, ratings: ratings, thumb: thumb, time: time, undeliverable_ingredients: undeliverable_ingredients, user: user, weeks: weeks)
            
            listOfParsedData.append(homeModel)
        }
        
        return listOfParsedData
    }
    
}
