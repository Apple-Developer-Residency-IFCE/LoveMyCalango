//
//  RemovePetButton.swift
//  loveMyPet
//
//  Created by Ravi navarro on 03/06/23.
//

import SwiftUI

struct RemovePetButton: View {
    
    @State var viewModel: EditPetViewModel
    @State var showAlert: Bool
    var dismiss: Dismiss
    
    typealias Dismiss = () -> Void
    
    init(viewModel: EditPetViewModel, showAlert: Bool? = false, dismiss: @escaping Dismiss) {
        self.viewModel = viewModel
        self._showAlert = State(initialValue: showAlert ?? false)
        self.dismiss = dismiss
    }
    
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
                self.dismiss()
            }))
    }
}
