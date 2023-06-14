//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct loveMyPetApp: App {
    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    ConfigView()
                        .navigationTitle("Title")
                        .navigationBarTitleDisplayMode(.inline)
                        .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
                }
            }
        }
    }
}
