//
//  Gender.swift
//  loveMyPet
//
//  Created by userext on 29/05/23.
//

import Foundation

enum Gender: String, CaseIterable {
    case male
    case female
    case none

    var rawValue: String {
        switch self {
        case .male:
            return "Macho"
        case .female:
            return "Fêmea"
        case .none:
            return "Não definido"
        }
    }
}
