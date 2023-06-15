//
//  PetData.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 12/06/23.
//

import SwiftUI

struct PetData: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack{
            Text(title)
                .font(.custom(Font.SemiBold, size: 20))
            Spacer()
            Text(value)
                .font(.custom(Font.Regular, size: 16))
        }
    }
}

struct PetData_Previews: PreviewProvider {
    static var previews: some View {
        PetData(title: "Nome", value: "Lua")
    }
}
