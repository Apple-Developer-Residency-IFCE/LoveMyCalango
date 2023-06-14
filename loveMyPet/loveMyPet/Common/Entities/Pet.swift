//
//  Pet.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI
struct Pet: Identifiable {

    static let mock = Pet()
    
    var id: UUID = UUID()
    var name: String = ""
    var specie: Specie = .none
    var breed: String = ""
    var image: String = "AvatarCat2"
    var gender: Gender = .none
    var birthDate: Date = Date()
    var weight: Double = 10.0
    var isNeutered: Bool = false
}
