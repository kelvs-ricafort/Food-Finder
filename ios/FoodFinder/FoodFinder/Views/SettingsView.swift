//
//  SettingsView.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/28/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("App Info")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Build")
                    Spacer()
                    Text(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown")
                        .foregroundStyle(.secondary)
                }
            }
            
            Section(header: Text("Developer")) {
                Text("Kelvin Ricafort")
            }
        }
    }
}

#Preview {
    SettingsView()
}
