//
//  EditPetViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

final class EditPetViewModel: ObservableObject {
    
    @Published var selectedTab: TabContextView = .pets
    
    @Published private(set) var pets: [Pet] = []
    
    @Published var newPet: Pet = .init() {
        didSet {
            addBtnIsEnable = !newPet.name.isEmpty
        }
    }
    
    @Published var selectedPet: Pet = .init() {
        didSet {
            addBtnIsEnable = !selectedPet.name.isEmpty
        }
    }
  
    @Published var weight: String = ""
    @Published var weightKG: Double = 0
    @Published var weightG: Double = 0
    @Published var isAddPetFlow: Bool = true
    
    @Published var addBtnIsEnable: Bool = false
    
    init(selectedPet: Pet) {
        self.selectedPet = selectedPet
        self.isAddPetFlow = false
        updateFormattedWeight()
        (weightKG, weightG) = getWeith()
    }
    
    init() {
        isAddPetFlow = true
        updateFormattedWeight()
        (weightKG, weightG) = getWeith()
    }
    
    var formattedWeight: String {
        return weight
    }
    
    func updateFormattedWeight() {
        let kg = (weightKG != 0) ? "\(weightKG)" : ""
        let g = (weightG != 0) ? ",\(weightG) kg" : "kg"
        weight = kg + g
        if isAddPetFlow {
            newPet.weight = weightKG + weightG
        } else {
            selectedPet.weight = weightKG + weightG
        }
    }
    
    func addPet() {
        pets.append(newPet)
    }
    
    func createNewPet() {
        newPet = Pet()
    }
    
    func removePet() {
        pets.enumerated().forEach { (index, pet) in
            if pet == selectedPet {
                pets.remove(at: index)
            }
        }
        
    }
    
    func getWeith() -> (kg: Double, g: Double) {
        
        let newKG = isAddPetFlow ? newPet.weight.rounded(.down) : selectedPet.weight.rounded(.down)
        let newg = isAddPetFlow ? (newPet.weight - newKG) : (selectedPet.weight - newKG)
        
        return (newKG, newg)
    }
}
