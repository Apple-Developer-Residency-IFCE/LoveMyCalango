//
//  HomeModel.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var pets = [Pet(id: UUID(), name: "Carlos", breed: "Carneiro", image: "AvatarDog1", specie: .turtle, gender: .male, castred: .no, date: Date()),
                           Pet(id: UUID(), name: "Sergio", breed: "Bode", image: "AvatarCat1", specie: .cat, gender: .male, castred: .yes, date: Date()),
                           Pet(id: UUID(), name: "Joana", breed: "Cabra", image: "AvatarCat2", specie: .cat, gender: .female, castred: .no, date: Date())]
    
    private func getPets() {}
}
