//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct loveMyPetApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .navigationTitle("Title")
                    .navigationBarTitleDisplayMode(.inline)
                    .tabItem {
                        Label("Pets", image: "IconPetFilled")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                //ConfigView()
                Text("Tela de Configuraçoes")
                    .tabItem {
                        Label("Configuraçoes", image: "IconConfigFilled")
                    }
            }
        }
    }
}
