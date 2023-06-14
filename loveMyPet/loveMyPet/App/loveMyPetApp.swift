//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct loveMyPetApp: App {
    
    @StateObject private var initialModel: EditPetViewModel = .init(selectedPet: .init(), isAdding: true)
    
    @State private var selectedTab: TabContextView = .pets
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeTabView(selected: $selectedTab) {
                    CustomHomeNavigation(selected: $selectedTab) {
                        HomeView()
                    } editView: {
                        EditPetView()
                            .environmentObject(initialModel)
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                } configView: {
                    Text("")
                }
                .navigationTitle(selectedTab == .pets ? TabContextView.pets.rawValue : TabContextView.config.rawValue)
                .navigationBarTitleDisplayMode(selectedTab == .pets ? .inline : .large)
            }
        }
    }
}
