//
//  Helper.swift
//  loveMyPet
//
//  Created by Vitor Costa on 14/06/23.
//

import SwiftUI
final class Helper {
    static let shared = Helper()

    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    private(set) var selectedTab: TabContextView = .pets

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

    func setSelectedTab(_ context: TabContextView) {
        selectedTab = context
    }

    var AddButtonDisable: Bool = true
}
