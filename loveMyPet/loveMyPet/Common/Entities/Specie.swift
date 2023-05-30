//
//  Specie.swift
//  loveMyPet
//
//  Created by userext on 29/05/23.
//

import Foundation
enum Specie: String, CaseIterable, Identifiable {
    var id: Self { self }

    case none = "Não escolhida"
    case gato = "Gato"
    case cachorro = "Cachorro"
    case passaro = "Pássaro"
    case coelho = "Coelho"
    case hamster = "Hamster"
    case tartaruga = "Tartaruga"
    case cavalo = "Cavalo"
    case custom = "Outros"
}
