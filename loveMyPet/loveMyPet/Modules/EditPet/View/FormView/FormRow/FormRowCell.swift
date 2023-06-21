//
//  FormRowCell.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct FormRowCell: View {
    
    var type: TypeFormRow
    
    @State var viewModel: EditPetViewModel

    @State private var date: Date = .init()
    
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
                DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                    .font(.custom(Font.Regular, size: 16))
                    .datePickerStyle(.compact)
            case .weight:
                WeightPicker(viewModel: viewModel)
                .frame(height: 100)
            case .castrated:
                CastradPicker(viewModel: viewModel)
            case .none:
                Text("")
            }
        }
        .listRowBackground(Color("White-F4F3FA"))
    }
}
