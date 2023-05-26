//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//
//
import SwiftUI

@main
struct loveMyPetApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                .navigationTitle("Title")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
