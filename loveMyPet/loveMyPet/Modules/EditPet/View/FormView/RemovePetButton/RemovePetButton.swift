//
//  RemovePetButton.swift
//  loveMyPet
//
//  Created by Ravi navarro on 03/06/23.
//

import SwiftUI

struct RemovePetButton: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    @State private var showAlert: Bool = false
    
    private var isAddPetFlow: Bool = true
    
    init(isAddPetFlow: Bool) {
        self.isAddPetFlow = isAddPetFlow
    }
    
    var body: some View {
        
        if !isAddPetFlow {
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
            .modifier(AlertMessageBuilder(isShowing: $showAlert))
        } else {
            Button("", action: {})
        }
    }
}
