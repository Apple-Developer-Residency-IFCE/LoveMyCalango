//
//  CastradPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct CastradPicker: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    
    var body: some View {
        Picker("", selection: $viewModel.selectedPet.castred) {
            ForEach(Castred.allCases) { castred in
                Text(castred.rawValue)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Constants.Font.Regular, size: 16))
        .pickerStyle(.menu)
    }
}
