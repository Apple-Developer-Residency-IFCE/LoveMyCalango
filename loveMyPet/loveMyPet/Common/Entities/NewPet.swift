//
//  Pet.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI
class NewPet: Identifiable {

    var id: UUID
    var name: String
    var specie: Specie
    var breed: String
    var image: Data
    var gender: Gender
    var birthDate: Date
    var weight: Double
    var isNeutered: Bool

    init() {
        self.id =  UUID()
        self.name =  ""
        self.specie =  Specie.none
        self.breed =  Specie.none.breed.first ?? "Não Escolhido"
        self.image =  Data()
        self.gender =  Gender.none
        self.birthDate =  .now
        self.weight =  0
        self.isNeutered =  false
    }

    init(coreDataPet: Pet) {
        self.id = coreDataPet.id
        self.name = coreDataPet.name
        self.gender = coreDataPet.gender
        self.specie = coreDataPet.specie
        self.breed = coreDataPet.breed
        self.birthDate = coreDataPet.birthDate ?? Date.now
        self.weight = coreDataPet.weight
        self.isNeutered = coreDataPet.isNeutered
        self.image = coreDataPet.image ?? Data()
    }
}
