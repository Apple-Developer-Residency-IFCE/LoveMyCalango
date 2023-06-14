//
//  ConfigView.swift
//  loveMyPet
//
//  Created by Vitor Costa on 12/06/23.
//

import SwiftUI

struct ConfigView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Configurações")
                .font(.custom(Font.SemiBold, size: 32))
                .foregroundColor(Color("FontColor"))
                .padding(.bottom, 32)
            
            Text("APARÊNCIA")
                .font(.custom(Font.SemiBold, size: 14))
                .foregroundColor(Color("FontColor"))
            
            ConfigOptions()
                .padding(.top, 20)
                .padding(.leading, 8)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 40)
        .padding(.leading, 24)
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
