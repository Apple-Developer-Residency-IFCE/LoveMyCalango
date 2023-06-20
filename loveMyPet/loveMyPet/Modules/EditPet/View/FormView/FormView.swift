//
//  FormView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

struct FormView: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    
    @State private var petName: String = ""
    
    @State private var showWeightPicker = false
        
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(Constants.Home.Placeholder.petName, text: $petName)
                        .foregroundColor(Color("Gray-8C8C8B"))
                        .font(.custom(Font.Regular, size: 16))
                        .listRowBackground(Color("White-F4F3FA"))
                        .onChange(of: petName) { newValue in
                            viewModel.changeNamePet(newName: newValue)
                        }
                    ForEach(TypeFormRow.allCases.prefix(4)) { caseValue in
                        FormRowCell(type: caseValue)
                    }
                }
                Section {
                    WeightRowFlow()
                    FormRowCell(type: .castrated)
                }
            }
            .scrollContentBackground(.hidden)
            if !viewModel.isAddPetFlow {
                RemovePetButton()
                    .padding(.bottom, 8)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            viewModel.disableAddBtn()
        }
    }
}
