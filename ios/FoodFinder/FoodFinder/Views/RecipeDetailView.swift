//
//  RecipeDetailView.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(RecipeModel.self) var model
    
    var body: some View {
        let recipe = model.selectedRecipe
        
        VStack {
            if let imageUrl = recipe?.image {
                AsyncImage(url: URL(string: imageUrl)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 164)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            } else {
                Image("detail-placeholder-image")
                    .resizable()
                    .frame(height: 164)
            }
            VStack {
                Text(recipe?.title ?? "No Recipe Available")
                    .font(.largeTitle)
                    .bold()
                Divider()
                HStack {
                    Image(systemName: "fork.knife.circle")
                    Text("Servings: ")
                        .bold()
                    Text("\(recipe?.servings ?? 0) servings")
                }
                HStack {
                    Image(systemName: "timer")
                    Text("Time: ")
                        .bold()
                    if let cooking = recipe?.cookingMinutes, cooking > 0 {
                        Text("\(cooking) min cooking")
                    } else if let ready = recipe?.readyInMinutes {
                        Text("\(ready) min total")
                    } else {
                        Text("N/A")
                    }
                }
                HStack {
                    Image(systemName: "flame.fill")
                    Text("Calories: ")
                        .bold()
                    if let calories = recipe?.nutrition?.nutrients.first(where: { $0.name == "Calories"}) {
                        Text("\(Int(calories.amount)) \(calories.unit)")
                    } else {
                        Text("N/A")
                    }
                }
                HStack {
                    Image(systemName: "globe")
                    Text("Source: ")
                        .bold()
                    if let url = URL(string: "\(recipe?.sourceUrl ?? "No link available")") {
                        Link(destination: url) {
                            Text("\(recipe?.sourceUrl ?? "No link available")")
                        }
                    } else {
                        Text("\(recipe?.sourceUrl ?? "No link available")")
                            .lineLimit(2)
                    }
                }
                Spacer()
                ScrollView {
                    if let ingredients = recipe?.extendedIngredients {
                        Text("Ingredients")
                            .font(.headline)
                        
                        ForEach(ingredients) { ingredient in
                            let amount = formatFraction(ingredient.amount)
                            Text("• \(amount) \(ingredient.unit) \(ingredient.name)")
                                .font(.body)
                        }
                    }
                    Text("Instructions: ")
                        .font(.headline)
                    
                    if let steps = recipe?.formattedInstructions, !steps.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(steps.indices, id: \.self) { index in
                                HStack(alignment: .top) {
                                    Text("\(index + 1).")
                                        .bold()
                                    Text(steps[index])
                                }
                            }
                        }
                    } else {
                        Text("No instructions available.")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            model.getRecipes()
        }
    }
}

#Preview {
    RecipeDetailView()
        .environment(RecipeModel())
}
