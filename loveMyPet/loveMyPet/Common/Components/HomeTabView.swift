//
//  HomeTabView.swift
//  loveMyPet
//
//  Created by Isaias Dimitri on 06/06/23.
//

import SwiftUI

struct HomeTabView<Home: View, Config: View>: View {
    let homeView: Home
    let configView: Config
    
    @State private var selectedTab = "pets"
    
    init(@ViewBuilder homeView: () -> Home, @ViewBuilder configView: () -> Config) {
        self.homeView = homeView()
        self.configView = configView()
    }
    
    var body: some View {
        TabView(selection: $selectedTab){
            homeView
                .tabItem {
                    Label("Pets", image: selectedTab == "pets" ? "IconPetFilled" : "IconPet")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .onTapGesture {
                    selectedTab = "pets"
                }
                .tag("pets")
            configView
                .tabItem {
                    Label("Configurações", image: selectedTab == "config" ? "IconConfigFilled" :"IconConfig")
                }
                .onTapGesture {
                    selectedTab = "config"
                }
                .tag("config")
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView {
            HomeView()
        } configView: {
            Text("Config")
        }
    }
}
