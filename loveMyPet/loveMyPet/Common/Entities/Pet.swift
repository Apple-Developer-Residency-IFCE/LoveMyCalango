//
//  Pet.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI
class NewPet: Identifiable {

    var id: UUID = UUID()
    var name: String = ""
    var specie: Specie = .none
    var breed: String = "Não Escolhido"
    var image: Data = Data()
    var gender: Gender = .none
    var birthDate: Date = Date()
    var weight: Double = 0
    var isNeutered: Bool = false
}
