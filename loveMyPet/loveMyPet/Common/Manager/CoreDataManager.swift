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
         container.loadPersistentStores { (_, error) in
             if let error = error {
                print("Falha na inicialização do core data \(error)")
             }
         }
         self.context = container.viewContext
    }

    let petRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
    let taskRequest: NSFetchRequest<PetTask> = PetTask.fetchRequest()

    private func saveData() {
        do {
            try context.save()
        } catch let error as NSError {
            print("\(error): Não foi possível salvar os dados")
        }
    }

    // PETS

    func getPetById(_ id: UUID) -> NewPet? {
        petRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            let result = try context.fetch(petRequest)
            guard let pet = result.first else {
                return nil
            }
            return NewPet(coreDataPet: pet)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func getPetList() -> [NewPet] {
        do {
            let fetchedPets = try context.fetch(petRequest)
            return fetchedPets.map { pet in
                NewPet(coreDataPet: pet)
            }
        } catch let error as NSError {
            print("\(error): Ocorreu um erro na busca de Pets")
        }
        return []
    }

    func addPet(pet: NewPet) {
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

    func deletePet(pet: NewPet) {
        petRequest.predicate = NSPredicate(format: "id == %@", pet.id as CVarArg)
        do {
            let result = try context.fetch(petRequest)
            let pet = result.first

            if let pet {
                context.delete(pet)
                saveData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func updatePet(_ pet: NewPet) {
        petRequest.predicate = NSPredicate(format: "id == %@", pet.id as CVarArg)

        do {
            let result = try context.fetch(petRequest)
            let coreDataPet = result.first

            if let coreDataPet = coreDataPet {
                coreDataPet.name = pet.name
                coreDataPet.gender = pet.gender
                coreDataPet.specie = pet.specie
                coreDataPet.breed = pet.breed
                coreDataPet.birthDate = pet.birthDate
                coreDataPet.weight = pet.weight
                coreDataPet.isNeutered = pet.isNeutered
                coreDataPet.image = pet.image

                try context.save()
            }
        } catch {
            print("Erro ao atualizar pet do CoreData: \(error.localizedDescription)")
        }
    }

    // TASKS

    private func fetchPet(id: UUID) -> Pet? {
        petRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            let result = try context.fetch(petRequest)
            guard let pet = result.first else {
                return nil
            }
            return pet
        } catch let error as NSError {
            print(error)
            return nil
        }
    }

    func getTaskById(_ id: UUID) -> NewTask? {
        taskRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            let result = try context.fetch(taskRequest)
            guard let task = result.first else {
                return nil
            }
            return NewTask(coreDataTask: task)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func getTaskList() -> [NewTask] {
        do {
            let fetchedTasks = try context.fetch(taskRequest)
            return fetchedTasks.map { task in
                NewTask(coreDataTask: task)
            }
        } catch let error as NSError {
            print("\(error): Ocorreu um erro na busca de Tarefas")
        }
        return []
    }

    func addTask(task: NewTask) {
        let newTask = PetTask(context: context)
        newTask.id = UUID()
        newTask.title = task.title
        newTask.summary = task.summary
        newTask.pet = fetchPet(id: task.pet.id)
        newTask.date = task.date
        newTask.time = task.time
        newTask.replay = task.replay
        newTask.reminder = task.reminder
        newTask.type = task.type
        newTask.isDone = task.isDone
        saveData()
    }

    func deleteTask(task: NewTask) {
        taskRequest.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
        do {
            let result = try context.fetch(taskRequest)
            let task = result.first

            if let task {
                context.delete(task)
                saveData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func updateTask(_ task: NewTask) {
        taskRequest.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)

        do {
            let result = try context.fetch(taskRequest)
            let coreDataTask = result.first

            if let coreDataTask = coreDataTask {
                coreDataTask.title = task.title
                coreDataTask.summary = task.summary
                coreDataTask.pet = fetchPet(id: task.pet.id)
                coreDataTask.date = task.date
                coreDataTask.time = task.time
                coreDataTask.replay = task.replay
                coreDataTask.reminder = task.reminder
                coreDataTask.type = task.type
                coreDataTask.isDone = task.isDone

                try context.save()
            }
        } catch {
            print("Erro ao atualizar task do CoreData: \(error.localizedDescription)")
        }
    }

}
