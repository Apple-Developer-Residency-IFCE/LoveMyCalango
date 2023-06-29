//
//  Specie.swift
//  loveMyPet
//
//  Created by userext on 30/05/23.
//

import Foundation

enum Specie: String, CaseIterable, Identifiable, Hashable {
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

    var breed: [String] {
        switch self {
        case .none:
            return ["Não Escolhido"]
        case .cat:
            return ["Não Escolhido", "Siamês", "Persa", "Bengal", "Maine Coon", "Ragdoll", "SRD"]
        case .dog:
            return ["Não Escolhido", "Labrador Retriever", "Bulldog Francês", "Golden Retriever", "Poodle", "Pastor Alemão", "SRD"]
        case .bird:
            return ["Não Escolhido", "Canário", "Calopsita", "Periquito", "Papagaio", "Agapornis", "SRD"]
        case .rabbit:
            return ["Não Escolhido", "Holland Lop", "Mini Lion", "Angorá", "Fuzzy Lop", "Rex", "SRD"]
        case .hamster:
            return ["Não Escolhido", "Sírio", "Russo", "Roborovski", "Chinês", "Anão", "SRD"]
        case .turtle:
            return ["Não Escolhido", "Tartaruga-de-orelha-vermelha", "Tartaruga-pintada", "Tartaruga-mordedora-comum", "Tartaruga-mordedora-de-musgo", "Tartaruga-de-esporas", "SRD"]
        case .horse:
            return ["Não Escolhido", "Puro Sangue Inglês", "Quarto de Milha", "Andaluz", "Lusitano", "Árabe", "SRD"]
        case .custom:
            return [""]
        }
    }
}
