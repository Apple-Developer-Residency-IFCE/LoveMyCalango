//
//  EditPetView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

final class SpecieWrapper: ObservableObject {
    
}

struct EditPetView: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    
    var body: some View {
        VStack {
            VStack {
                Image("AvatarCat2")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
               Text("Trocar foto")
                    .font(.custom(Constants.Font.Regular, size: 13))
            }
            .padding(.top, 16)
            FormView(pet: viewModel.pet)
        }
    }
}

struct EditPetView_Previews: PreviewProvider {
    static var previews: some View {
        EditPetView()
    }
}
