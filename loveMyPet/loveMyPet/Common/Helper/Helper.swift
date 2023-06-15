//
//  Helper.swift
//  loveMyPet
//
//  Created by Vitor Costa on 14/06/23.
//

import SwiftUI
final class Helper {
    static let shared = Helper()
    
    func convertToColorScheme(customColorScheme: AppColorScheme) -> ColorScheme? {
            switch customColorScheme {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return nil
            }
        }

}
