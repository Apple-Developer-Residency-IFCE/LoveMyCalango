//
//  Specie.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import Foundation

enum Specie: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case cat = "Gato"
    case dog = "Cachorro"
    case fish = "Peixe"
    case turtle = "Tartaruga"
    case horse = "Cavalo"
    case none = "Nenhum"
    case custom = "Custom"
    
    var breeds: [String] {
        switch self {
        case .cat:
            return ["Siamês", "Persa", "SRD"]
        case .dog:
            return ["Labrador", "Golden Retriever", "Pastor Alemão", "SRD"]
        case .fish:
            return ["Peixe Dourado", "Betta", "SRD"]
        case .turtle:
            return ["Tartaruga de Ouvido Vermelho", "Tartaruga Pintada", "Tartaruga de Caixa", "SRD"]
        case .horse:
            return ["Puro Sangue Inglês", "Quarto de Milha", "Cavalo Árabe", "SRD"]
        case .none:
            return ["SRD"]
        default:
            return []
        }
    }
}
