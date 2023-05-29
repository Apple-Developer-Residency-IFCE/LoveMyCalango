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
            //HomeView()
            EmptyView()
                .tabItem {
                    Label("Pets", systemImage: "heart.fill")
                }
            //ConfigView()
            EmptyView()
                .tabItem {
                    Label("Configuraçoes", systemImage: "gearshape.fill")
                }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

