//
//  MainView.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import SwiftUI

struct MainView: View {
    @State var recipes = [Recipe]()
    
    @State private var searchQuery = ""
    @State private var selectedRecipe: Recipe?
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for recipes", text: $searchQuery)
                    .textFieldStyle(.roundedBorder)
                Button {
                    searchForRecipes()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.green)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            List(recipes) { recipe in
                HStack(spacing: 10) {
                    AsyncImage(url: URL(string: recipe.image)) { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        ProgressView()
                    }
                    Text(recipe.title)
                }
                .onTapGesture {
                    selectedRecipe = recipe
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .sheet(item: $selectedRecipe) { item in
            RecipeDetailView(recipe: item)
        }
        .padding()
    }
    
    func searchForRecipes() {
        Task {
            recipes = await service.getRecipes(term: searchQuery)
        }
    }
}

#Preview {
    MainView()
}
