//
//  AddTaskViewModel.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 17/07/23.
//

import Foundation

class AddTaskViewModel: ObservableObject {

    @Published var pets = [NewPet]()

    @Published var summary: String = ""
    @Published var title: String = ""
    @Published var type: TaskType = .none
    @Published var replay: Replay = .never
    @Published var reminder: Reminder = .none
    @Published var selectedDate: Date = Date()
    @Published var selectedTime: Date = Date()
    @Published var selectedPet: NewPet?

    var isFormValid: Bool {
        return selectedPet != nil  && !title.isEmpty
    }

    init() {
        fetchAllPets()
    }

    func fetchAllPets() {
        pets = CoreDataManager.shared.getPetList()
    }

    func createTask() {
        let task = NewTask()
        task.title = title
        task.type = type
        task.replay = replay
        task.reminder = reminder
        task.date = selectedDate
        task.time = selectedTime
        task.summary = summary
        task.pet = selectedPet ?? NewPet()

        CoreDataManager.shared.addTask(task: task)
    }
}
