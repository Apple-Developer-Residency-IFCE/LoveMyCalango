//
//  FormRowCell.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct FormRowCell: View {
    
    private var type: TypeFormRow
    
    @Binding var pet: Pet
    
    @State private var date: Date = .init()
    @State private var gender: String = ""
    @State private var specie: String = ""
    @State private var breed: String = ""
    @State private var customSpecie: String = .init()
    @State private var castred: Castred = .no
    @State private var showWeightPicker = false
    @State private var selectedSpecie: Specie
    @State private var selectedGender: Gender
    @State private var weight: Double = 0
    
    private let kgRange = 0...100
    private let gRange = stride(from: 0, through: 900, by: 100).map { $0 }
    
    init(type: TypeFormRow, pet: Binding<Pet>) {
        self.type = type
        self._pet = pet
        self._selectedGender = State(initialValue: pet.wrappedValue.gender)
        self._selectedSpecie = State(initialValue: pet.wrappedValue.specie)
        self._breed = State(initialValue: pet.wrappedValue.breed)
    }
    
    var body: some View {
        HStack {
            Text(type.title)
                .foregroundColor(Color("Black-15181D"))
                .font(.custom(Constants.Font.Regular, size: 16))
            switch type {
            case .gender:
                GenderPicker(gender: $selectedGender)
            case .specie:
                SpeciePicker(specie: $selectedSpecie)
            case .breed:
                BreedPicker(breed: $pet.breed, breeds: selectedSpecie.breeds)
            case .birth:
                DatePicker("", selection: $date, displayedComponents: .date)
                    .font(.custom(Constants.Font.Regular, size: 16))
                    .accentColor(Color("MainColor"))
            case .weight:
                WeightPicker(for: $weight, show: $showWeightPicker)
            case .castrated:
               CastradPicker(is: $castred)
            }
        }
        .listRowBackground(Color("White-F4F3FA"))
    }
}

struct FormRowCell_Previews: PreviewProvider {
    static var previews: some View {
        let pet = Binding.constant(Pet.mock)
        Form {
            FormRowCell(type: .specie, pet: pet)
            FormRowCell(type: .gender, pet: pet)
            FormRowCell(type: .breed, pet: pet)
            FormRowCell(type: .castrated, pet: pet)
            FormRowCell(type: .weight, pet: pet)
        }
    }
}
