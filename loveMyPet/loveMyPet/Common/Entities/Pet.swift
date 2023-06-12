//
//  Pet.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI
struct Pet: Identifiable {

    let id: UUID = UUID()
    let name: String = "Hugo"
    let specie: Specie = Specie.dog
    let breed: String = "Pug"
    let image: String = "AvatarDog1"
    let gender: Gender = Gender.male
    let birthDate: Date = Date()
    let weight: Double = 10.0
    let isNeutered: Bool = false

}
