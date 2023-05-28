//
//  SpeciePicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct SpeciePicker: View {
    @Binding var selectedSpecie: Specie

    init(specie selectedSpecie: Binding<Specie>) {
        self._selectedSpecie = selectedSpecie
    }
    
    var body: some View {
        Picker("", selection: $selectedSpecie) {
            ForEach(Specie.allCases) { specie in
                Text(specie.rawValue)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Constants.Font.Regular, size: 16))
        .pickerStyle(MenuPickerStyle())
    }
}


struct SpecieProvider_Previews: PreviewProvider {
    static var previews: some View {
        let specie = Binding.constant(Specie.cat)
        SpeciePicker(specie: specie)
    }
}
