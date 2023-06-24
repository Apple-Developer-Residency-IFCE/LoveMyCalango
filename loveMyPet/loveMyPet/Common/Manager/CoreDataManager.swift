//
//  CoreDataManager.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 20/06/23.
//

import Foundation
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    var context: NSManagedObjectContext
    
     private init() {
         container = NSPersistentContainer(name: "loveMyPet")
         container.loadPersistentStores { (description, error) in
             if let error = error{
                print("Falha na inicialização do core data \(error)")
             }
         }
         self.context = container.viewContext
    }
    
    func getPetById(_ id: UUID) -> NewPet? {
        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let pet = result.first else{
                return nil
            }
            return .init(coreDataPet: pet)
        }
        catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getPetList() -> [NewPet] {
        let fetch: NSFetchRequest<Pet> = Pet.fetchRequest()
        do {
            let fetchedPets = try context.fetch(fetch)
            return fetchedPets.map { pet in
                NewPet(coreDataPet: pet)
            }
        } catch let error as NSError {
            print("\(error): Ocorreu um erro na busca de Pets")
        }
        return []
    }
    
    func add(pet: NewPet) {
        let newPet = Pet(context: context)
        newPet.id = UUID()
        newPet.name = pet.name
        newPet.image = pet.image
        newPet.gender = pet.gender
        newPet.specie = pet.specie
        newPet.breed = pet.breed
        newPet.birthDate = pet.birthDate
        newPet.weight = pet.weight
        newPet.isNeutered = pet.isNeutered
        saveData()
    }
    
    func delete(pet: NewPet) {
        
        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", pet.id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            let coreDataPet = result.first
            
            if let coreDataPet {
                deleteData(pet: coreDataPet)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func update(_ pet: NewPet) {
        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", pet.id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            let petEntity = result.first
            
            if let petEntity = petEntity {
                petEntity.name = pet.name
                petEntity.gender = pet.gender
                petEntity.specie = pet.specie
                petEntity.breed = pet.breed
                petEntity.birthDate = pet.birthDate
                petEntity.weight = pet.weight
                petEntity.isNeutered = pet.isNeutered
                petEntity.image = pet.image
                
                try context.save()
            }
        } catch {
            print("Erro ao atualizar pet do CoreData: \(error.localizedDescription)")
        }
    }
    
    private func deleteData(pet: Pet) {
        context.delete(pet)
        saveData()
    }
    
    private func saveData() {
        do {
            try context.save()
        } catch let error as NSError {
            print("\(error): Não foi possível salvar os dados")
        }
    }
}
