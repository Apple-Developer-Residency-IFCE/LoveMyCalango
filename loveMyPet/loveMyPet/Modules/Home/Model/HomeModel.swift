//
//  HomeModel.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var pets: [Pet] = [.init(),.init(),.init()]
    
    private func getPets() {}
}
