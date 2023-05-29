//
//  HomeModel.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var pets: [Pet] = []
    
    init() {
        getPets()
    }
    
    private func getPets() {
        pets = [Pet(id: UUID(), petName: "Carlos", petRace: "Carneiro", petImage: Image("AvatarDog1")),
                     Pet(id: UUID(), petName: "Sergio", petRace: "Bode", petImage: Image("AvatarCat1")),
                     Pet(id: UUID(), petName: "Joana", petRace: "Cabra", petImage: Image("AvatarCat2"))]
    }
}
