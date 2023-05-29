//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import Foundation

struct Pet: Identifiable{
    let id =  UUID()
    let petName: String
    let petRace: String
    let petImage: String
}
