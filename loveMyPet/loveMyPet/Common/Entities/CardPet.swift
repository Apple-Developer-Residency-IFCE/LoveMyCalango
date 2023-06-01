//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Pet: Identifiable{
    
    static let mock = Pet(id: UUID(),
                          name: "Hanna",
                          breed: "SRD",
                          image: Image("AvatarCat1"),
                          specie: .cat,
                          gender: .female)
    
    var id: UUID
    var name: String
    var breed: String
    var image: Image
    var specie: Specie
    var gender: Gender
}
