//
//  RecipeDetailView.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe?
    
    var body: some View {
        Text(recipe?.title ?? "No recipe available")
    }
}

#Preview {
    RecipeDetailView()
}
