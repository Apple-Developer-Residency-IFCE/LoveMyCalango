//
//  FormView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

struct FormView: View {
    
    
    @StateObject var viewModel: EditPetViewModel
    
    @State private var petName: String = ""
    @State private var showWeightPicker = false
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(Constants.Home.Placeholder.petName, text: viewModel.isAddPetFlow ? $petName : $viewModel.selectedPet.name)
                        .foregroundColor(Color(CustomColor.FontColor))
                        .font(.custom(Font.Regular, size: 16))
                        .listRowBackground(Color(CustomColor.PickerRowBackground))
                        .onChange(of: viewModel.isAddPetFlow ? petName : viewModel.selectedPet.name) { newValue in
                            viewModel.changeNamePet(newName: newValue)
                        }
                    
                    ForEach(TypeFormRow.allCases.prefix(4)) { caseValue in
                        FormRowCell(type: caseValue, viewModel: viewModel)
                    }
                }
                Section {
                    WeightRowFlow(viewModel: viewModel)
                    FormRowCell(type: .isNeutered, viewModel: viewModel)
                }
            }
            .scrollContentBackground(.hidden)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
