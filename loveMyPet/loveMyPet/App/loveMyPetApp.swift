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
    @StateObject var initialModel: EditPetViewModel = .init()
    @State var selectedTab: TabContextView = .pets
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeTabView(selectedTab: $selectedTab) {
                    CustomHomeNavigation(selectedTab: $selectedTab) {
                        HomeView()
                    } addView: {
                        EditPetView()
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                } configView: {
                   ConfigView()
                }
                .environmentObject(initialModel)
                .navigationTitle(selectedTab == .pets ? TabContextView.pets.rawValue : "")
                .navigationBarTitleDisplayMode(selectedTab == .pets ? .inline : .large)
                .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
            }
        }
    }
}
