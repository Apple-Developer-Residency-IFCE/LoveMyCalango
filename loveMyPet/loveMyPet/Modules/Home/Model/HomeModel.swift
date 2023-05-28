//
//  HomeModel.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var pets = [Pet(id: UUID(), name: "Carlos", breed: "Carneiro", image: Image("AvatarDog1"), specie: .turtle, gender: .male),
                           Pet(id: UUID(), name: "Sergio", breed: "Bode", image: Image("AvatarCat1"), specie: .cat, gender: .male),
                           Pet(id: UUID(), name: "Joana", breed: "Cabra", image: Image("AvatarCat2"), specie: .cat, gender: .female)]
    
    private func getPets() {}
}
