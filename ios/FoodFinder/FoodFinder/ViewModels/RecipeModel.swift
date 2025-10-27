//
//  RecipeModel.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import Foundation
import SwiftUI

@Observable
class RecipeModel {
    var recipes = [Recipe]()
    
    var searchQuery = ""
    var selectedRecipe: Recipe?
    var service = DataService()
    
    func searchForRecipes() {
        Task {
            recipes = await service.getRecipes(term: searchQuery)
        }
    }
    
    func getRecipes() {
        Task {
            if let id = selectedRecipe?.id {
                selectedRecipe = await service.getRecipe(by: id)
            }
        }
    }
}
