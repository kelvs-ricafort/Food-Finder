//
//  AppEntry.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import SwiftUI

@main
struct AppEntry: App {
    @State var model = RecipeModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(model)
        }
    }
}
