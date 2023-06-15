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
    @StateObject private var initialModel: EditPetViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeTabView(selected: $initialModel.selectedTab) {
                    CustomHomeNavigation() {
                        HomeView()
                    } editView: {
                        EditPetView()
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                } configView: {
                   ConfigView()
                }
                .environmentObject(initialModel)
                .navigationTitle(initialModel.selectedTab == .pets ? TabContextView.pets.rawValue : "")
                .navigationBarTitleDisplayMode(initialModel.selectedTab == .pets ? .inline : .large)
                .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
            }
        }
    }
}
