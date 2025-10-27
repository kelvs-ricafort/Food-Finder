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
                Text(recipe.title)
            }
        }
        .padding()
    }
    
    func searchForRecipes() {
        // TODO: Implement search feature
        Task {
            recipes = await service.getRecipes(term: searchQuery)
        }
    }
}

#Preview {
    MainView()
}
