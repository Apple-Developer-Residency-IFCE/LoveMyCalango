//
//  Pet.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct NewPet: Identifiable, Hashable {

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

extension NewPet: Equatable {
    static func == (lhs: NewPet, rhs: NewPet) -> Bool {
        return lhs.image == rhs.image &&
        lhs.name == rhs.name &&
        lhs.gender == rhs.gender &&
        lhs.specie == rhs.specie &&
        lhs.breed == rhs.breed &&
        lhs.birthDate == rhs.birthDate &&
        lhs.weight == rhs.weight &&
        lhs.isNeutered == rhs.isNeutered
    }

    static func != (lhs: NewPet, rhs: NewPet) -> Bool {
        return !(lhs == rhs)
    }
}
