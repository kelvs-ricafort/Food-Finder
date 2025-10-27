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
                    .font(.headline)
                Divider()
                HStack {
                    Image(systemName: "fork.knife.circle")
                    Text("Servings: ")
                        .bold()
                    Text("\(recipe?.servings ?? 0) servings")
                }
                HStack {
                    Image(systemName: "cooktop")
                    Text("Cooking Minutes: ")
                        .bold()
                    Text("\(recipe?.cookingMinutes ?? 0) minutes")
                }
                HStack {
                    Image(systemName: "globe")
                    Text("Source: ")
                        .bold()
                    Text("\(recipe?.spoonacularSourceUrl ?? "No link available")")
                        .lineLimit(2)
                }
                Spacer()
                ScrollView {
                    Text("Instructions: ")
                        .bold()
                    Text("\(recipe?.instructions ?? "No Cooking Instructions Available")")
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
