//
//  EditTaskViewModel.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 20/07/23.
//

import Foundation

class EditTaskViewModel: ObservableObject {

    @Published var pets = [NewPet]()
    @Published var task: NewTask

    init(task: NewTask) {
        self.task = task
        fetchAllPets()
    }

    func fetchAllPets() {
        pets = CoreDataManager.shared.getPetList()
    }

    func updateTask() {
        CoreDataManager.shared.updateTask(task)
    }

    func deleteTask() {
        CoreDataManager.shared.deleteTask(task: task)
    }
}
