//
//  Gender.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import Foundation

enum Gender: CaseIterable, Identifiable {
    var id: Self { self }
    
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
            return "Nenhum"
        }
    }
}
