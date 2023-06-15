//
//  HomeTabView.swift
//  loveMyPet
//
//  Created by Isaias Dimitri on 06/06/23.
//

import SwiftUI

struct HomeTabView<Home: View, Config: View>: View {
    
    @ViewBuilder let homeView: Home
    @ViewBuilder let configView: Config
    
    @Binding var selectedTab: TabContextView
    
    init(selected: Binding<TabContextView>, homeView: () -> Home, configView: () -> Config) {
        self.homeView = homeView()
        self.configView = configView()
        self._selectedTab = selected
    }
    
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

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(selected: .constant(.pets)) {
            HomeView()
        } configView: {
            Text(TabContextView.config.rawValue)
        }
    }
}
