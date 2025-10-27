//
//  RecipeResponse.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import Foundation

struct RecipeResponse: Decodable {
    var results: [Recipe]
}
