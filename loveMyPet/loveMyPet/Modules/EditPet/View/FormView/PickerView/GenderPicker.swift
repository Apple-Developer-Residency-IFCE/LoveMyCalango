//
//  GenderPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct GenderPicker: View {
    
    @State var viewModel: EditPetViewModel

    var body: some View {
        Picker("", selection: viewModel.isAddPetFlow ? $viewModel.newPet.gender : $viewModel.selectedPet.gender) {
            ForEach(Gender.allCases, id: \.id) { gender in
                Text(gender.rawValue)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Font.Regular, size: 16))
        .pickerStyle(.menu)
    }
}
