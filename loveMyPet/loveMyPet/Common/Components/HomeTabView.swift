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
    
    init(selectedTab: Binding<TabContextView>, homeView: () -> Home, configView: () -> Config) {
        self.homeView = homeView()
        self.configView = configView()
        self._selectedTab = selectedTab
    }
    
    var body: some View {
        TabView(selection: $selectedTab){
            homeView
                .tabItem {
                    Label(
                        title: {
                            Text(TabContextView.pets.rawValue)
                                                        },
                        icon: { Image(selectedTab == .pets ? Assets.Icon.petFilled : Assets.Icon.pet) }
                    )
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color(CustomColor.TabViewBackground), for: .tabBar)
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
                .toolbarBackground(Color(CustomColor.TabViewBackground), for: .tabBar)
                .onTapGesture {
                    selectedTab = .config
                }
                .tag(TabContextView.config)
        }
        .accentColor(Color(CustomColor.MainColor))
        .onChange(of: selectedTab) { newValue in
            print(newValue)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeTabView(selectedTab: .constant(.pets)) {
            HomeView()
        } configView: {
            Text(TabContextView.config.rawValue)
        }
    }
}
