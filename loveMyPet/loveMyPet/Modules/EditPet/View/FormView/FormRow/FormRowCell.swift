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
    
    @State private var breed: String = ""
    @State private var customSpecie: String = .init()
    @State private var showWeightPicker = false
    @State private var weight: Double = 0
    
    private let kgRange = 0...100
    private let gRange = stride(from: 0, through: 900, by: 100).map { $0 }
    
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
                WeightPicker(for: $weight, show: $showWeightPicker)
            case .castrated:
                CastradPicker()
            }
        }
        .listRowBackground(Color("White-F4F3FA"))
    }
}
