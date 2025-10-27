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
        }
    }
}

#Preview {
    RecipeDetailView()
}
