//
//  SpeciePicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct SpeciePicker: View {
    
    @StateObject var viewModel: EditPetViewModel

    var body: some View {
        Picker("", selection: viewModel.isAddPetFlow ? $viewModel.newPet.specie : $viewModel.selectedPet.specie) {
            ForEach(Specie.allCases) { specie in
                Text(specie.rawValue)
            }
        }
        .accentColor(Color(CustomColor.FontPickers))
        .font(.custom(Font.Regular, size: 16))
        .pickerStyle(MenuPickerStyle())
    }
}

