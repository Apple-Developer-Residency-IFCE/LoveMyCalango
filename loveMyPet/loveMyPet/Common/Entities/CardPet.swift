//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct Pet: Identifiable{
    
    static let mockEmptyPet = Pet(id: UUID(),
                                  name: "",
                                  breed: "",
                                  image: "",
                                  specie: .none,
                                  gender: .none,
                                  castred: .no,
                                  date: Date())
    
    static let mock = Pet(id: UUID(),
                          name: "Hanna",
                          breed: "SRD",
                          image: "AvatarCat1",
                          specie: .cat,
                          gender: .female,
                          castred: .yes,
                          date: Date())
    
    var id: UUID
    var name: String
    var breed: String
    var image: String
    var specie: Specie
    var gender: Gender
    var castred: Castred
    var date: Date
}
