//
//  ConfigViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 14/06/23.
//

import SwiftUI

final class ConfigViewModel: ObservableObject {
    @Published var isON = false
    private(set) var selectedScheme: Int?
    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system

    func changeScheme(index: Int?) {
        switch index {
        case 0:
            preferredColor = .system
        case 1:
            preferredColor = .light
        case 2:
            preferredColor = .dark
        default:
            break
        }
    }
}
