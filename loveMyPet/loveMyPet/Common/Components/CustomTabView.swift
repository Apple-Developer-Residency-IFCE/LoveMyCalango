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
                    Label {
                        Text(TabContextView.pets.rawValue)
                            .foregroundColor(Color(CustomColor.MainColor, bundle: .main))
                    } icon: {
                        Image(selectedTab == .pets ? Assets.Icon.petFilled : Assets.Icon.pet)
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color(CustomColor.TabViewBackground), for: .tabBar)
                .onTapGesture {
                    selectedTab = .pets
                }
                .tag(TabContextView.pets)
            
            configView
                .tabItem {
                    Label{
                        Text(TabContextView.config.rawValue)
                            .foregroundColor(.white)
                    } icon: {
                        Image(selectedTab == .config ?
                              Assets.Icon.configFilled : Assets.Icon.config)
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color(CustomColor.TabViewBackground), for: .tabBar)
                .onTapGesture {
                    selectedTab = .config
                }
                .tag(TabContextView.config)
        }
    }
}
