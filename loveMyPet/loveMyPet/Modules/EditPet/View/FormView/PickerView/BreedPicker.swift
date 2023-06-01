//
//  BreedPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct BreedPicker: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    let breeds: [String]
    
    var body: some View {
        Picker("", selection: viewModel.selectedPet.breed) {
            ForEach(breeds, id: \.self) { breed in
                Text(breed)
                    .tag(breed)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Constants.Font.Regular, size: 16))
        .pickerStyle(.menu)
    }
}
