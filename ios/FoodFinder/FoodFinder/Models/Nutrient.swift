//
//  Nutrient.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/28/25.
//

import Foundation

struct Nutrient: Decodable {
    let name: String
    let amount: Double
    let unit: String
}
