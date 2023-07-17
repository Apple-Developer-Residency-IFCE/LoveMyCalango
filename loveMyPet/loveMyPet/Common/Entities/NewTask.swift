//
//  NewTask.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 17/07/23.
//

import Foundation
import SwiftUI

class NewTask: Identifiable {

    var id: UUID
    var title: String
    var summary: String
    var type: TaskType
    var replay: Replay
    var reminder: Reminder
    var date: Date
    var time: Date
    var isDone: Bool
    var pet: NewPet

    init() {
        self.id = UUID()
        self.title = ""
        self.summary = ""
        self.type = .none
        self.replay = .never
        self.reminder = .none
        self.date = Date()
        self.time = Date()
        self.isDone = false
        self.pet = NewPet()
    }

    init(coreDataTask: PetTask) {
        self.id = coreDataTask.id
        self.title = coreDataTask.title
        self.summary = coreDataTask.summary
        self.type = coreDataTask.type
        self.replay = coreDataTask.replay
        self.reminder = coreDataTask.reminder
        self.date = coreDataTask.date ?? .now
        self.time = coreDataTask.time ?? .now
        self.isDone = coreDataTask.isDone
        self.pet = NewPet(coreDataPet: coreDataTask.pet ?? Pet(context: CoreDataManager.shared.context))
    }
}
