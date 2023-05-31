//
//  Specie.swift
//  loveMyPet
//
//  Created by userext on 30/05/23.
//

import Foundation
 enum Specie: String, CaseIterable, Identifiable {
     var id: Self { self }

     case none = "Não escolhida"
     case cat = "Gato"
     case dog = "Cachorro"
     case bird = "Pássaro"
     case rabbit = "Coelho"
     case hamster = "Hamster"
     case turtle = "Tartaruga"
     case horse = "Cavalo"
     case custom = "Outros"
 }
