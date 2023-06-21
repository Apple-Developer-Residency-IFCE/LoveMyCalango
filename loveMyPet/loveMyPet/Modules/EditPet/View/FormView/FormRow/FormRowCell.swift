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
            Text(type.title)
                .foregroundColor(Color(CustomColor.FontColor))
                .font(.custom(Font.Regular, size: 16))
            switch type {
            case .gender:
                GenderPicker()
            case .specie:
                SpeciePicker()
            case .breed:
                BreedPicker()
            case .birth:
                DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                    .font(.custom(Font.Regular, size: 16))
                    .datePickerStyle(.compact)
            case .weight:
                WeightPicker()
                .frame(height: 100)
            case .castrated:
                CastradPicker()
            case .none:
                Text("")
            }
        }
        .listRowBackground(Color(CustomColor.PickerRowBackground))
    }
}
