//
//  Pet.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI
struct Pet: Identifiable {

    var id: UUID = UUID()
    var name: String = "Carlos"
    var specie: Specie = .dog
    var breed: String = "Pastor Alemão"
    var image: String = "Imagem"
    var gender: Gender = Gender.male
    var birthDate: Date = Date()
    var weight: Double = 10.0
    var isNeutered: Bool = false
}
