//
//  ConfigButton.swift
//  loveMyPet
//
//  Created by Vitor Costa on 13/06/23.
//

import SwiftUI

struct ConfigButton: View {
    @Binding var isSelected: Bool
    
    var body: some View {
        Image(isSelected ? "IconSelected" : "IconSelect")
            .resizable()
            .frame(width: 20, height: 20)
    }
}

struct ConfigButton_Previews: PreviewProvider {
    @State static var isSelected = false
    
    static var previews: some View {
        ConfigButton(isSelected: $isSelected)
    }
}
