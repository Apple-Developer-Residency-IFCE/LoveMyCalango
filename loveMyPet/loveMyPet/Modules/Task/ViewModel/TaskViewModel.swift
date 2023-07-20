//
//  TaskViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa and José Winny on 03/07/23.
//

import Foundation

final class TaskViewModel: ObservableObject {

    @Published var catCuriosity: String = ""
    @Published var days: [String] = []
    @Published var today: Int = 1
    @Published var showCuriosityCard: Bool = true

    init() {
        Task {
            await getCatCuriosity()
        }
        do {
            days = try Date().firstLetterOfWeekdayForMonth()
        } catch {
            print("Erro ao criar o array: \(error)")
        }
        today = Date().dayOfMonth()
        
        print(CoreDataManager.shared.getPetList())
    }

    @MainActor
    public func getCatCuriosity() async {
        let currentDate = Date()

        if let lastFetchDate = UserDefaults.standard.object(forKey: "LastFetchDate") as? Date,
           Calendar.current.isDate(lastFetchDate, inSameDayAs: currentDate) {
            guard let storedCuriosity = UserDefaults.standard.string(forKey: "CatCuriosity") else {
                catCuriosity = Fact().fact
                return
            }

            catCuriosity = storedCuriosity
        } else {

            do {
                let curiosity = try await CuriosityService().getCuriosity().fact
                catCuriosity = curiosity

                UserDefaults.standard.set(currentDate, forKey: "LastFetchDate")
                UserDefaults.standard.set(curiosity, forKey: "CatCuriosity")
            } catch {
                catCuriosity = Fact().fact
                print(error)
            }
        }
    }
}
