//
//  AddTaskViewModel.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 17/07/23.
//

import Foundation

class AddTaskViewModel: ObservableObject {
    
    @Published var pets = [Pet]()
    
    @Published var summary: String = ""
    @Published var title: String = ""
    @Published var type: TaskType = .none
    @Published var replay: Replay = .never
    @Published var reminder: Reminder = .none
    @Published var selectedDate: Date? = Date()
    @Published var selectedTime: Date? = Date()
    @Published var selectedPet: Pet?
    
    init() {
        fetchAllPets()
    }
    
    func fetchAllPets() {
        pets = CoreDataManager.shared.fetchAllPets()
    }
}
