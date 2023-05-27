//
//  HomeModel.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var pets = [Pet(id: UUID(), petName: "Carlos", petRace: "Carneiro", petImage: ""),
                           Pet(id: UUID(), petName: "Sergio", petRace: "Bode", petImage: ""),
                           Pet(id: UUID(), petName: "Joana", petRace: "Cabra", petImage: "")]
    
    private func getPets() {}
}
