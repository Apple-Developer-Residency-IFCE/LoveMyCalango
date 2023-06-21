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
    @State var selectedTab: TabContextView = .pets
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                CustomTabView(homeView: {
                    CustomHomeNavigation {
                        HomeView()
                            .navigationTitle(Constants.Home.title)
                            .navigationBarTitleDisplayMode(.inline)
                    } addView: {
                        EditPetView()
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    }
//                customFunc: {
//                        #AQUI VEM A FUNÇÃO DE ADICIONAR
//                    }
                }, configView: {
                    ConfigView()
                }, selectedTab: $selectedTab)                        .navigationTitle(selectedTab == .pets ? TabContextView.pets.rawValue : "")
                    .navigationBarTitleDisplayMode(selectedTab == .pets ? .inline : .large)
                    .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
            }
                
        }
    }
}


