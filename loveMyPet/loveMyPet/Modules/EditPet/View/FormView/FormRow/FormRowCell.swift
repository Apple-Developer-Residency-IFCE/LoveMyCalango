//
//  FormRowCell.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct FormRowCell: View {
    
    var type: TypeFormRow
    var viewModel: EditPetViewModel
    
    var body: some View {
        HStack {
            Text(type.title)
                .foregroundColor(Color("Black-15181D"))
                .font(.custom(Font.Regular, size: 16))
            switch type {
            case .gender:
                GenderPicker(viewModel: viewModel)
            case .specie:
                SpeciePicker(viewModel: viewModel)
            case .breed:
                BreedPicker(viewModel: viewModel)
            case .birth:
                BirthDatePicker(viewModel: viewModel)
            case .weight:
                WeightPicker(viewModel: viewModel)
                .frame(height: 100)
            case .castrated:
                NeuteredPicker(viewModel: viewModel)
            case .none:
                Text("")
            }
        }
        .listRowBackground(Color("White-F4F3FA"))
    }
}
