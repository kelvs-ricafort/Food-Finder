//
//  MainView.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import SwiftUI

struct MainView: View {
    @Environment(RecipeModel.self) var model
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @State private var showSettings = false
    
    var body: some View {
        @Bindable var model = model
        
        if sizeClass == .compact {
            // iPhone: NavigationStack with Sheet
            NavigationStack {
                VStack {
                    HStack {
                        TextField("Search for recipes", text: $model.searchQuery)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            model.searchForRecipes()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(.green)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    List(model.recipes) { recipe in
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
                            model.selectedRecipe = recipe
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                }
                .navigationTitle("Food Finder")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showSettings = true
                        } label: {
                            Image(systemName: "gearshape")
                        }
                    }
                }
            }
            .sheet(item: $model.selectedRecipe) { item in
                RecipeDetailView()
            }
            .sheet(isPresented: $showSettings) {
                NavigationStack {
                    SettingsView()
                }
            }
        } else {
            // iPad: NavigationSplitView
            NavigationSplitView {
                NavigationStack {
                    VStack {
                        HStack {
                            TextField("Search for recipes", text: $model.searchQuery)
                                .textFieldStyle(.roundedBorder)
                            Button {
                                model.searchForRecipes()
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                    .background(.green)
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        List(model.recipes) { recipe in
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
                                model.selectedRecipe = recipe
                            }
                        }
                        .listStyle(.plain)
                        .scrollIndicators(.hidden)
                    }
                    .navigationTitle("Food Finder")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showSettings = true
                            } label: {
                                Image(systemName: "gearshape")
                            }
                        }
                    }
                }
            } detail: {
                if let _ = model.selectedRecipe {
                    RecipeDetailView()
                } else {
                    Text("Select a recipe")
                        .foregroundStyle(.secondary)
                        .font(.title3)
                }
            }
            .sheet(isPresented: $showSettings) {
                NavigationStack {
                    SettingsView()
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environment(RecipeModel())
}
