//
//  Pet.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI
class Pet: Identifiable, Equatable {

    static let mock = Pet()
    
    var id: UUID = UUID()
    var name: String = ""
    var specie: Specie = .none
    var breed: String = "Não Escolhido"
    var image: String = "AvatarCat2"
    var gender: Gender = .none
    var birthDate: Date = Date()
    var weight: Double = 0
    var isNeutered: Bool = false
    
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        return lhs.id == rhs.id
    }
}
