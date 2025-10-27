//
//  DataService.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import Foundation

struct DataService {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getRecipes(term: String) async {
        // Check if api key exists
        guard apiKey != nil else {
            return
        }
        
        // 1. Create URL
        let urlString = "https://api.spoonacular.com/recipes/complexSearch?query=\(term)"
        if let url = URL(string: urlString) {
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue(apiKey!, forHTTPHeaderField: "x-api-key")
            
            // 3. Send Request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print(data)
                print(response)
            } catch {
                print(error)
            }
        }
    }
    
    func getRecipe(by id: Int) async {
        // Check if api key exists
        guard apiKey != nil else {
            return
        }
        
        // 1. Create URL
        let urlString = "https://api.spoonacular.com/recipes/\(id)/information"
        if let url = URL(string: urlString) {
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue(apiKey!, forHTTPHeaderField: "x-api-key")
            
            // 3, Send request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print(data)
                print(response)
            } catch {
                print(error)
            }
        }
    }
}
