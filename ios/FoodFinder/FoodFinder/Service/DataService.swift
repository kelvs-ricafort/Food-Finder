//
//  DataService.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import Foundation

struct DataService {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getRecipes(term: String) async -> [Recipe] {
        // Check if api key exists
        guard apiKey != nil else {
            return [Recipe]()
        }
        
        // 1. Create URL
        let urlString = "https://api.spoonacular.com/recipes/complexSearch?query=\(term)"
        if let url = URL(string: urlString) {
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue(apiKey!, forHTTPHeaderField: "x-api-key")
            
            // 3. Send Request
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode(RecipeResponse.self, from: data)
                return recipeData.results
            } catch {
                print(error)
            }
        }
        return [Recipe]()
    }
    
    func getRecipe(by id: Int) async -> Recipe? {
        // Check if api key exists
        guard apiKey != nil else {
            return nil
        }
        
        // 1. Create URL
        let urlString = "https://api.spoonacular.com/recipes/\(id)/information?includeNutrition=true"
        if let url = URL(string: urlString) {
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue(apiKey!, forHTTPHeaderField: "x-api-key")
            
            // 3, Send request
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode(Recipe.self, from: data)
                return recipeData
            } catch {
                print(error)
            }
        }
        return nil
    }
}
