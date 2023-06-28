//
//  HomeViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 20/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var pets: [NewPet] = []
    
    func fetchAllPets() {
        pets = []
        pets = CoreDataManager.shared.getPetList()
    }
}
