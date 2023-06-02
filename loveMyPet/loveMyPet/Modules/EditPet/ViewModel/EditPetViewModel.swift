//
//  EditPetViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

final class EditPetViewModel: ObservableObject {

    @Published var selectedPet: Pet
    private func weight: String = ""
    @Published private var weightKG: Double = 0
    @Published private var weightG: Double = 0
    
    init(selectedPet: Pet) {
        self.selectedPet = selectedPet
    }
    
    func makeWeight() {
        
    }
}
