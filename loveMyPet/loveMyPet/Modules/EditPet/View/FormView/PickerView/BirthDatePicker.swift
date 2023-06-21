//
//  BirthDatePicker.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 21/06/23.
//

import SwiftUI

struct BirthDatePicker: View {
    
    @State private var date: Date = .init()
    @StateObject var viewModel: EditPetViewModel
    
    var body: some View {
        DatePicker("", selection: viewModel.isAddPetFlow ? $viewModel.newPet.birthDate : Binding {
            return viewModel.selectedPet.birthDate ?? date
        } set: { newValue  in
            viewModel.selectedPet.birthDate = newValue
        }, in: ...Date(), displayedComponents: .date)
        .font(.custom(Font.Regular, size: 16))
        .datePickerStyle(.compact)
    }
}
