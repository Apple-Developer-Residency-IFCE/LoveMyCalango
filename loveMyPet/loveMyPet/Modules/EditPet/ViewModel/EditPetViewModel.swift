//
//  EditPetViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI
import CoreData

final class EditPetViewModel: ObservableObject {
        
    let coreData = CoreDataManager.shared
    
    @Published var newPet: NewPet = .init()
    
    @Published var selectedPet: NewPet {
        didSet {
            Helper.shared.isAddBtnEnable = true
        }
    }
    
    @Published var weight: String = ""
    
    @Published var weightKG: Int = 0 {
        didSet {
            updateFormattedWeight()
        }
    }
    
    @Published var weightG: Int = 0 {
        didSet {
            updateFormattedWeight()
        }
    }
    
    @Published var isAddPetFlow: Bool = true
    
    @Published var addBtnIsEnable: Bool = false
    
    init() {
        selectedPet = NewPet()
        updateFormattedWeight()
        (weightKG, weightG) = getWeigth()
    }
    
    init(selectedPet: NewPet) {
        isAddPetFlow = false
        self.selectedPet = selectedPet
        updateFormattedWeight()
        (weightKG, weightG) = getWeigth()
    }
    
    func changePetToEdit(pet: NewPet) {
        self.selectedPet = pet
    }
        
    func disableAddBtn() {
        addBtnIsEnable = false
    }
    
    func changeNamePet(newName: String) {
        if isAddPetFlow {
            newPet.name = newName
        } else {
            selectedPet.name = newName
        }
        Helper.shared.isAddBtnEnable = true
    }
    
    func changePetImage(data: Data) {
        if isAddPetFlow {
            newPet.image = data
        } else {
            selectedPet.image = data
        }
    }
    
    var formattedWeight: String {
        return weight
    }
    
    func updateFormattedWeight() {
        let kg = (weightKG != 0) ? "\(weightKG)" : ""
        let g = (weightG != 0) ? "\(weightKG != 0 ? "," : "0,")\(weightG) kg" : "kg"
        weight = kg + g
        if isAddPetFlow {
            newPet.weight = Double(weightKG) + Double(weightG % 10)
        } else {
            selectedPet.weight = Double(weightKG) + Double(weightG % 10)
        }
        Helper.shared.isAddBtnEnable = true
    }
    
    func getWeigth() -> (kg: Int, g: Int) {
        
        let newKG = isAddPetFlow ? newPet.weight.rounded(.down) : selectedPet.weight.rounded(.down)
        let newg = isAddPetFlow ? (newPet.weight - newKG ) : (selectedPet.weight - newKG)
        
        return (Int(newKG ), Int(newg))
    }
    
    func addPet() {
        coreData.add(pet: newPet)
    }
    
    func updatePet() {
        if isAddPetFlow {
            addPet()
        } else {
            coreData.update(selectedPet)
        }
    }
    
    func removePet(pet: NewPet) {
        coreData.delete(pet: pet)
    }
}
