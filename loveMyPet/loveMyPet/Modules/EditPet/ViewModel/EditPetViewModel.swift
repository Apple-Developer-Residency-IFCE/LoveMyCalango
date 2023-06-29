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

    // ATRIBUTOS

    @Published var newPet: NewPet = NewPet()

    @Published var selectedPet: NewPet

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

    // INITS

    init() {
        selectedPet = NewPet()
        updateFormattedWeight()
    }

    init(pet: NewPet) {
        isAddPetFlow = false
        selectedPet = pet
        (weightKG, weightG) = getWeight()
        updateFormattedWeight()
    }

    // FORM FUNCTIONS

    func changeNamePet(newName: String) {
        if isAddPetFlow {
            newPet.name = newName
        } else {
            selectedPet.name = newName
        }
        Helper.shared.AddButtonDisable = false
    }

    func changePetImage(data: Data) {
        if isAddPetFlow {
            newPet.image = data
        } else {
            selectedPet.image = data
        }
    }

    // PESO

    func updateFormattedWeight() {
        let kg = weightKG != 0 ? "\(weightKG)" : "0 "
        let g = weightG != 0 ? "\(weightKG != 0 ? "," : "0,") \(weightG) kg" : "kg"

        weight = kg + g

        if isAddPetFlow {
            newPet.weight = Double(weightKG) + Double(weightG % 10) / 10.0
        } else {
            selectedPet.weight = Double(weightKG) + Double(weightG % 10) / 10.0
        }
    }

    func getWeight() -> (kg: Int, g: Int) {
        let kg = Int(selectedPet.weight)
        let g = Int((selectedPet.weight - Double(kg)) * 10)
        return (kg, g)
    }

    // PET CRUD

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
