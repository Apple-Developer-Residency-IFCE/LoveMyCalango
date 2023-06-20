//
//  HomeViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 20/06/23.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var pets: [Pet] = []
    
    func populatePets(_ pets: [Pet]) {
        self.pets = pets
    }
}
