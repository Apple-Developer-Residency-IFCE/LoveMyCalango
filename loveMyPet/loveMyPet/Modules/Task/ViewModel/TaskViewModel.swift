//
//  TaskViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 03/07/23.
//

import Foundation

final class TaskViewModel: ObservableObject {
    @Published var catCuriosity: String = ""
        
    @MainActor
    public func getCatCuriosity() async {
        let currentDate = Date()
        
        // Check if the last fetch date exists and is the same as the current date
        if let lastFetchDate = UserDefaults.standard.object(forKey: "LastFetchDate") as? Date, Calendar.current.isDate(lastFetchDate, inSameDayAs: currentDate) {
            // Use the stored curiosity from UserDefaults
            guard let storedCuriosity = UserDefaults.standard.string(forKey: "CatCuriosity") else {
                // Handle the case when stored curiosity is not available
                catCuriosity = Fact().fact
                return
            }
            
            catCuriosity = storedCuriosity
        } else {
            do {
                // Make the API request to fetch new curiosity
                let curiosity = try await CuriosityService().getCuriosity().fact
                catCuriosity = curiosity
                
                // Store the current date and fetched curiosity in UserDefaults
                UserDefaults.standard.set(currentDate, forKey: "LastFetchDate")
                UserDefaults.standard.set(curiosity, forKey: "CatCuriosity")
            } catch {
                // Handle the error
                catCuriosity = Fact().fact
                print(error)
            }
        }
    }
}
