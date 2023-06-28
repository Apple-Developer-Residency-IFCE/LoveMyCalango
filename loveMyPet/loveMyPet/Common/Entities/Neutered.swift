//
//  isNeutered.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import Foundation

enum isNeutered: CaseIterable, Identifiable {
    var id: Self { self }
    
    case yes
    case no
    
    var rawValue: String {
        switch self {
        case .yes:
            return "Sim"
        case .no:
            return "Não"
        }
    }
}
