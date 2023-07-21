//
//  Pet+CoreDataProperties.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 20/06/23.
//
//

import Foundation
import CoreData

extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var name: String
    @NSManaged public var genderValue: String?
    @NSManaged public var specieValue: String?
    @NSManaged public var breedValue: String?
    @NSManaged public var image: Data?
    @NSManaged public var id: UUID
    @NSManaged public var isNeutered: Bool
    @NSManaged public var birthDate: Date?
    @NSManaged public var weight: Double
    @NSManaged public var task: NSSet?

    var breed: String {
        get {
            return breedValue ?? ""
        }
        set {
            breedValue = newValue
        }
    }

    var gender: Gender {
        get {
            return Gender(rawValue: genderValue ?? "") ?? .none
        }
        set {
            genderValue = newValue.rawValue
        }
    }

    var specie: Specie {
        get {
            return Specie(rawValue: specieValue ?? "") ?? .none
        }
        set {
            specieValue = newValue.rawValue
        }
    }

}

extension Pet {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: PetTask)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: PetTask)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension Pet: Identifiable {

}
