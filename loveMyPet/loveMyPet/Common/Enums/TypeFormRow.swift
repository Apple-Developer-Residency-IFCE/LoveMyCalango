//
//  TypeFormRow.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import Foundation

enum TypeFormRow: CaseIterable, Identifiable {
    var id: Self { self }
    
    case gender
    case birth
    case specie
    case breed
    case weight
    case castrated
    case none
    
    var title: String {
        switch self {
        case .gender:
            return "Gênero"
        case .specie:
            return "Espécie"
        case .breed:
            return "Raça"
        case .birth:
            return "Nascimento"
        case .weight:
            return ""
        case .castrated:
            return "Castrado(a)?"
        case .none:
            return ""
        }
    }
}
