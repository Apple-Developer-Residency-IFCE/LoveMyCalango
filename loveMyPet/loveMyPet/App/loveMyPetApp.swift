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
                NavigationView {
                    HomeView()
                        .navigationTitle("Title")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Pets", systemImage: "")
                }
                .toolbarBackground(.visible, for: .tabBar)
                //ConfigView()
                Text("Tela de Configuraçoes")
                    .tabItem {
                        Label("Configuraçoes", systemImage: "")
                    }
                
            }
        }
    }
}
