//
//  GenderPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct GenderPicker: View {
    @Binding var selectedGender: Gender
    
    init(gender selectedGender: Binding<Gender>) {
        self._selectedGender = selectedGender
    }
    
    var body: some View {
        Picker("", selection: $selectedGender) {
            ForEach(Gender.allCases) { gender in
                Text(gender.rawValue)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Constants.Font.Regular, size: 16))
        .pickerStyle(.menu)
    }
}

struct GenderPicker_Previews: PreviewProvider {
    static var previews: some View {
        let gender = Binding.constant(Gender.female)
        GenderPicker(gender: gender)
    }
}
