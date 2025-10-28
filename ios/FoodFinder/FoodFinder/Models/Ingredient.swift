//
//  Ingredient.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/28/25.
//

import Foundation

struct Ingredient: Decodable, Identifiable {
    var id: Int
    var name: String
    var amount: Double
    var unit: String
}
