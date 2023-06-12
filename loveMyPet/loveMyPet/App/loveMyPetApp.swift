//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct loveMyPetApp: App {
    
    let viewmodel: EditPetViewModel = .init(selectedPet: .init(), isAdding: false)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EditPetView()
                    .environmentObject(viewmodel)
            }
        }
    }
}
