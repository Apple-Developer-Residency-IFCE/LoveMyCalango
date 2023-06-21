//
//  EditPetViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

final class EditPetViewModel: ObservableObject {
    
    @Published var selectedTab: TabContextView = .pets
        
    @Published var newPet: NewPet = .init() {
        didSet {
            Helper.shared.isAddBtnEnable = !(newPet.name.isEmpty)
        }
    }
    
    @Published var selectedPet: Pet {
        didSet {
            Helper.shared.isAddBtnEnable = !(selectedPet.name?.isEmpty ?? true)
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
    
    init(selectedPet: Pet) {
        self.selectedPet = selectedPet
        self.isAddPetFlow = false
        updateFormattedWeight()
        (weightKG, weightG) = getWeigth()
    }
    
    init() {
        selectedPet = Pet()
        isAddPetFlow = true
        updateFormattedWeight()
        createNewPet()
        (weightKG, weightG) = getWeigth()
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
    }
    
    func getWeigth() -> (kg: Int, g: Int) {
        
        let newKG = isAddPetFlow ? newPet.weight.rounded(.down) : selectedPet.weight.rounded(.down)
        let newg = isAddPetFlow ? (newPet.weight - newKG ) : (selectedPet.weight - newKG)
        
        return (Int(newKG ), Int(newg))
    }
    
    func changeNamePet(newName: String) {
        Helper.shared.isAddBtnEnable = true
        if isAddPetFlow {
            newPet.name = newName
        } else {
            selectedPet.name = newName
        }
    }
    
    func changePetImage(data: Data) {
        if isAddPetFlow {
            newPet.image = data
        } else {
            selectedPet.image = data
        }
    }
    
    func disableAddBtn() {
        addBtnIsEnable = false
    }
    
    func addPet() {
        CoreDataManager.shared.create(pet: newPet)
    }
    
    func createNewPet() {
        newPet = NewPet()
    }
    
    func updatePet() {
        if isAddPetFlow {
            addPet()
        } else {
            CoreDataManager.shared.saveData()
        }
    }
    
    func removePet(pet: Pet) {
        CoreDataManager.shared.delete(pet: pet)
    }
}
