//
//  OnboardingViewDetails.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/27/25.
//

import SwiftUI

struct OnboardingViewDetails: View {
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack(spacing: 0) {
                Spacer()
                Spacer()
                Image("onboarding")
                Text(headline)
                    .bold()
                    .font(Font.system(size: 22))
                    .padding(.top, 32)
                Text(subHeadline)
                    .padding(.horizontal)
                    .padding(.top, 4)
                Spacer()
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(.white)
                            .frame(height: 50)
                        Image(systemName: "arrow.right")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to Food Finder", subHeadline: "Food Finder makes it super easy to search for recipes online."
    ) {
        // Nothing
    }
}
