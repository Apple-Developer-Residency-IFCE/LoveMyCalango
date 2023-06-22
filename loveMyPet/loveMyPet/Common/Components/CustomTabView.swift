//
//  HomeTabView.swift
//  loveMyPet
//
//  Created by Isaias Dimitri on 06/06/23.
//

import SwiftUI

struct CustomTabView<Home: View, Config: View>: View {
    
    @Binding var selectedTab: TabContextView
    @ViewBuilder let homeView: Home
    @ViewBuilder let configView: Config
    
    var body: some View {
        TabView(selection: $selectedTab){
            homeView
                .tabItem {
                    Label(TabContextView.pets.rawValue, image: selectedTab == .pets ? Assets.Icon.petFilled : Assets.Icon.pet)
                }
                .toolbarBackground(.visible, for: .tabBar)
                .onTapGesture {
                    selectedTab = .pets
                }
                .tag(TabContextView.pets)
            
            configView
                .tabItem {
                    Label(TabContextView.config.rawValue,
                          image: selectedTab == .config ?
                          Assets.Icon.configFilled : Assets.Icon.config)
                }
                .toolbarBackground(.visible, for: .tabBar)
                .onTapGesture {
                    selectedTab = .config
                }
                .tag(TabContextView.config)
        }
    }
}
