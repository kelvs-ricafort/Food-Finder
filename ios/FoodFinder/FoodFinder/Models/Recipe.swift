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
    var readyInMinutes: Int?
    var sourceUrl: String?
    var instructions: String?
    var nutrition: Nutrition?
    var extendedIngredients: [Ingredient]?
    
    // Computed property for calories (if available)
    var calories: Int {
        Int(nutrition?.nutrients.first(where: { $0.name.lowercased() == "calories"})?.amount ?? 0)
    }
    
    // Computed properly to cleanly format HTML instructions
    var formattedInstructions: [String] {
        guard let instructions = instructions else { return [] }
        
        let cleaned = instructions
            .replacingOccurrences(of: "<ol>", with: "")
            .replacingOccurrences(of: "</ol>", with: "")
            .replacingOccurrences(of: "</li>", with: "")
        
        let steps = cleaned.components(separatedBy: "<li>")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        return steps
    }
}
