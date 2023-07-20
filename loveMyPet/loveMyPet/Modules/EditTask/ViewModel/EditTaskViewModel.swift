//
//  EditTaskViewModel.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 20/07/23.
//

import Foundation

class EditTaskViewModel: ObservableObject {

    @Published var pets = [NewPet]()

    init() {
        fetchAllPets()
    }

    func fetchAllPets() {
        pets = CoreDataManager.shared.getPetList()
    }

    func updateTask(task: NewTask) {
        CoreDataManager.shared.updateTask(task)
    }

    func deleteTask(task: NewTask) {
        CoreDataManager.shared.deleteTask(task: task)
    }
}
