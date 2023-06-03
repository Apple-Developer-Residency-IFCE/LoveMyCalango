//
//  FormView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

struct FormView: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    
    @State private var showWeightPicker = false
        
    var body: some View {
        VStack {
            Form {
                Section {
                    if !viewModel.isAddPetFlow {
                        Text(viewModel.selectedPet.name)
                            .foregroundColor(Color("Gray-8C8C8B"))
                            .font(.custom(Constants.Font.Regular, size: 16))
                            .listRowBackground(Color("White-F4F3FA"))
                    } else {
                        TextField("Nome do pet", text: $viewModel.selectedPet.name)
                            .foregroundColor(Color("Gray-8C8C8B"))
                            .font(.custom(Constants.Font.Regular, size: 16))
                            .listRowBackground(Color("White-F4F3FA"))
                    }
                    FormRowCell(type: .gender)
                    FormRowCell(type: .specie)
                    FormRowCell(type: .breed)
                    FormRowCell(type: .birth)
                }
                Section {
                    WeightRowFlow()
                    FormRowCell(type: .castrated)
                }
            }
            .scrollContentBackground(.hidden)
            
            RemovePetButton()
            Spacer()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
