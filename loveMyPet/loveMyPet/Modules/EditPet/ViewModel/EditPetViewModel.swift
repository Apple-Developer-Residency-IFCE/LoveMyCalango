//
//  EditPetViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

final class EditPetViewModel: ObservableObject {
    
    @Published var selectedPet: Pet 
    @Published var weight: String = ""
    @Published var weightKG: Int = 0
    @Published var weightG: Int = 0
    
    @Published var isAddPetFlow: Bool
    
    init(selectedPet: Pet, isAdding: Bool) {
        self.selectedPet = selectedPet
        self.isAddPetFlow = isAdding
        updateFormattedWeight()
    }
    
    var formattedWeight: String {
        return weight
    }
    
    func updateFormattedWeight() {
        weight = "\(weightKG) kg " + (weightG != 0 ? String("\(weightG) g") : "")
    }
}
