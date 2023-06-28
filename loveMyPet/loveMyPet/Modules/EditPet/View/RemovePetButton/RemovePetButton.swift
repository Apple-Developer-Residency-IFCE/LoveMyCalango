//
//  RemovePetButton.swift
//  loveMyPet
//
//  Created by Ravi navarro on 03/06/23.
//

import SwiftUI

struct RemovePetButton: View {
    
    @StateObject var viewModel: EditPetViewModel
    @State var showAlert: Bool = true
    var dismiss: () -> Void
    
    var body: some View {
        Button(action: {
            showAlert.toggle()
        }) {
            ZStack {
                Color("Red-D12929")
                Text(Constants.Home.deletePet)
                    .foregroundColor(.white)
                    .font(.custom(Font.SemiBold, size: 16))
            }
            .frame(height: 50)
            .cornerRadius(10)
            .padding(.horizontal, 24)
        }
        .modifier(
            AlertMessageBuilder(isShowing: $showAlert, handleDelete: {
                viewModel.removePet(pet: viewModel.selectedPet)
                dismiss()
            }))
    }
}
