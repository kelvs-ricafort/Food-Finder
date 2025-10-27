//
//  OnboardingView.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedIndex = 0
    
    var body: some View {
        ZStack {
            if selectedIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            } else {
                Color(red: 139/255, green: 166/225, blue: 65/255)
            }
            TabView(selection: $selectedIndex) {
                OnboardingViewDetails(
                    bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                    headline: "Welcome to Food Finder",
                    subHeadline: "Food Finder makes it super easy to search for recipes online"
                ) {
                    withAnimation {
                        selectedIndex = 1
                    }
                }
                .tag(0)
                .ignoresSafeArea()
                OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/225, blue: 65/255),
                                      headline: "The app for a healthier you",
                                      subHeadline: "Just type in your search query and hit the search button"
                ) {
                    dismiss()
                }
                .tag(1)
                .ignoresSafeArea()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedIndex == 0 ? .white : .gray)
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 221)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
