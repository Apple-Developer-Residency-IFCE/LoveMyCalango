//
//  PetTask+CoreDataProperties.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 17/07/23.
//
//

import Foundation
import CoreData


extension PetTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetTask> {
        return NSFetchRequest<PetTask>(entityName: "PetTask")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID
    @NSManaged public var time: Date?
    @NSManaged public var reminderValue: String?
    @NSManaged public var replayValue: String?
    @NSManaged public var summaryValue: String?
    @NSManaged public var typeValue: String?
    @NSManaged public var title: String
    @NSManaged public var isDone: Bool
    @NSManaged public var pet: Pet?
    
    var summary: String {
        get {
            return summaryValue ?? ""
        }
        set {
            summaryValue = newValue
        }
    }
        
    var type: TaskType {
        get {
            return TaskType(rawValue: typeValue ?? "") ?? .none
        }
        set {
            typeValue = newValue.rawValue
        }
    }
    
    var replay: Replay {
        get {
            return Replay(rawValue: replayValue ?? "") ?? .never
        }
        set {
            replayValue = newValue.rawValue
        }
    }
    
    var reminder: Reminder {
        get {
            return Reminder(rawValue: reminderValue ?? "") ?? .none
        }
        set {
            reminderValue = newValue.rawValue
        }
    }

}

extension PetTask : Identifiable {

}
