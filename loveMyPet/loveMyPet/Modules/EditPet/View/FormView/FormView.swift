//
//  FormView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

struct FormView: View {
    
    @State var pet: Pet
    @Binding var selectedSpecie: Specie
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text(pet.name)
                        .foregroundColor(Color("Gray-8C8C8B"))
                        .font(.custom(Constants.Font.Regular, size: 16))
                        .listRowBackground(Color("White-F4F3FA"))
                    FormRowCell(type: .gender, pet: $pet)
                    FormRowCell(type: .specie, pet: $pet)
                    FormRowCell(type: .breed, pet: $pet)
                    FormRowCell(type: .birth, pet: $pet)
                }
                Section {
                    FormRowCell(type: .weight, pet: $pet)
                    FormRowCell(type: .castrated, pet: $pet)
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
        let specie: Binding<Specie> = .constant(.cat)
        FormView(pet: .mock, selectedSpecie: specie)
    }
}
