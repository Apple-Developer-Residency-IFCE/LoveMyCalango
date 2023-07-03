//
//  TaskViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 03/07/23.
//

import Foundation

final class TaskViewModel: ObservableObject {
    @Published var catCuriosity: String = ""
    
    public func getCatCuriosity() async throws {
        catCuriosity = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. S"
    }
}
