//
//  RemovePetButton.swift
//  loveMyPet
//
//  Created by Ravi navarro on 03/06/23.
//

import SwiftUI

struct RemovePetButton: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    
    var body: some View {
        
        if !viewModel.isAddPetFlow {
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
        } else {
            Button("", action: {})
        }
    }
}
