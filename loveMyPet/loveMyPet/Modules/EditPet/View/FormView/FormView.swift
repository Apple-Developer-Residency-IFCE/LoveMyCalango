//
//  FormView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

struct FormView: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text(viewModel.selectedPet.name)
                        .foregroundColor(Color("Gray-8C8C8B"))
                        .font(.custom(Constants.Font.Regular, size: 16))
                        .listRowBackground(Color("White-F4F3FA"))
                    FormRowCell(type: .gender)
                    FormRowCell(type: .specie)
                    FormRowCell(type: .breed)
                    FormRowCell(type: .birth)
                }
                Section {
                    FormRowCell(type: .weight)
                    FormRowCell(type: .castrated)
                }
            }
            .scrollContentBackground(.hidden)
            
            Button(action: {
                // Ação a ser executada ao pressionar o botão
            }) {
                ZStack {
                    Color("Red-D12929")
                    Text("Excluir Cadastro")
                        .foregroundColor(.white)
                        .font(.custom(Constants.Font.SemiBold, size: 16))
                }
                .frame(height: 50)
                .cornerRadius(10)
                .padding(.horizontal, 24)
            }
            Spacer()
        }
    }
}

struct FormView_Previews: PreviewProvider {
    
    static var previews: some View {
        @EnvironmentObject var viewModel: EditPetViewModel
        let specie: Binding<Specie> = .constant(.cat)
        FormView()
    }
}
