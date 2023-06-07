//
//  FormRowCell.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct FormRowCell: View {
    
    var type: TypeFormRow
    
    @EnvironmentObject private var viewModel: EditPetViewModel

    @State private var date: Date = .init()
    
    var body: some View {
        HStack {
            Text(type == .weight ? "" : type.title)
                .foregroundColor(Color("Black-15181D"))
                .font(.custom(Constants.Font.Regular, size: 16))
            switch type {
            case .gender:
                GenderPicker()
            case .specie:
                SpeciePicker()
            case .breed:
                BreedPicker()
            case .birth:
                DatePicker("", selection: $date, in: ...date, displayedComponents: .date)
                    .font(.custom(Constants.Font.Regular, size: 16))
                    .datePickerStyle(.compact)
            case .weight:
                WeightPicker(weightKg: $viewModel.weightKG, weightG: $viewModel.weightG)
                .frame(height: 100)
            case .castrated:
                CastradPicker()
            case .none:
                Text("")
            }
        }
        .listRowBackground(Color("White-F4F3FA"))
    }
}
