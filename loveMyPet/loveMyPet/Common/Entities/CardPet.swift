//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Pet: Identifiable{
    
    let id: UUID
    let petName: String
    let petRace: String
    let petImage: Image
    
    init(id: UUID, petName: String, petRace: String, petImage: Image) {
        self.id = id
        self.petName = petName
        self.petRace = petRace
        self.petImage = petImage
    }
}
