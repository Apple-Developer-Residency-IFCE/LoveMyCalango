//
//  HomeViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 20/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var pets = [Pet]()
    
    init() {
        fetchAllPets()
    }
    
    func fetchAllPets() {
        pets = CoreDataManager.shared.fetchAll()
    }
}
