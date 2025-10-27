//
//  Recipe.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    var id: Int
    var title: String
    var image: String
    var servings: Int?
    var cookingMinutes: Int?
    var spoonacularSourceUrl: String?
    var instructions: String?
}
