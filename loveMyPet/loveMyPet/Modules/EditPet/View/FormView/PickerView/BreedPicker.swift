//
//  BreedPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct BreedPicker: View {
    @Binding var selectedBreed: String
    let breeds: [String]

    init(breed selectedBreed: Binding<String>, breeds: [String]) {
        self._selectedBreed = selectedBreed
        self.breeds = breeds
    }
    
    var body: some View {
        Picker("", selection: $selectedBreed) {
            ForEach(breeds, id: \.self) { breed in
                Text(breed)
                    .tag(breed)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Constants.Font.Regular, size: 16))
        .pickerStyle(.menu)
    }
}

struct BreedPicker_Previews: PreviewProvider {
    @State static var selectedBreed: String = ""
    
    static var previews: some View {
        let specie = Specie.cat
        let breeds = specie.breeds
        
        BreedPicker(breed: $selectedBreed, breeds: breeds)
    }
}
