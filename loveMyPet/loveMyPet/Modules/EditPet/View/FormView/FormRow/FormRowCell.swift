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
    
    @State private var showWeightPicker = false

    
    var body: some View {
        HStack {
            Text(type.title)
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
                DatePicker("", selection: $date, displayedComponents: .date)
                    .font(.custom(Constants.Font.Regular, size: 16))
                    .accentColor(Color("MainColor"))
            case .weight:
                Button("") {
                    withAnimation(.ripple(index: 3)) {
                        showWeightPicker.toggle()
                    }
                }
                
                if showWeightPicker {
                    WeightPicker(weightKg: $weightKG, weightG: $weightG)
                }
                
            case .castrated:
                CastradPicker()
            }
        }
        .listRowBackground(Color("White-F4F3FA"))
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}
