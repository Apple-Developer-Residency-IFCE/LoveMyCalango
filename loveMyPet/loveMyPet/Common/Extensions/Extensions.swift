//
//  Extensions.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI

extension View {
    func applyCustomHome(showing showingView: AnyView) -> some View {
        modifier(CustomHomeNavigation(showingView: showingView))
    }
}
