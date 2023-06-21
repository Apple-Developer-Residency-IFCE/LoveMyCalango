//
//  PetDetailViewModel.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 12/06/23.
//

import Foundation

class PetDetailViewModel: ObservableObject {
    
    @Published var pet: Pet
    
    init(pet: Pet) {
        self.pet = pet
    }
        
    func formattedBirthDate (date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "pt_BR")
        return dateFormatter.string(from: date)
    }
}
