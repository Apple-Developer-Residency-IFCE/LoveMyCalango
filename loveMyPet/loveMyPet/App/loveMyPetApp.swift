//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct loveMyPetApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeTabView {
                    HomeView()
                        .toolbar {
                            Button {
                                
                            } label: {
                                Text("Adicionar")
                                    .foregroundColor(Color("Gray-8C8C8B"))
                                    .font(.custom(Font.Regular, size: 16))
                            }

                        }
                } configView: {
                    Text("")
                }
                .navigationTitle("Pets")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
