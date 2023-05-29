//
//  CustomTabView.swift
//  loveMyPet
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView {
            //PetsView()
            Text("Tela de Pets")
                .tabItem {
                    Label("Pets", systemImage: "")
                }
                .toolbarBackground(.visible, for: .tabBar)
            //ConfigView()
            Text("Tela de Configuraçoes")
                .tabItem {
                    Label("Configuraçoes", systemImage: "")
                }
            
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

