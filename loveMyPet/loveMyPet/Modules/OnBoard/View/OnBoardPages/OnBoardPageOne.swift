//
//  OnBoardViewOne.swift
//  loveMyPet
//
//  Created by Vitor Costa on 18/07/23.
//

import SwiftUI

struct OnBoardPageOne: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(Assets.Image.onBoardImageOne)
            Text("Cadastrar seu pet")
                .font(.custom(Font.SemiBold, size: 28))
            Text("Tenha as informações do seu pet e todo histórico para consultas futuras.")
                .font(.custom(Font.Regular, size: 13))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 35)
    }
}

struct OnBoardPageOne_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardPageOne()
    }
}
