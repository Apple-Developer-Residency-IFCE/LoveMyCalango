//
//  OnBoardPageTwo.swift
//  loveMyPet
//
//  Created by Vitor Costa on 18/07/23.
//

import SwiftUI

struct OnBoardPageTwo: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(Assets.Image.onBoardImageTwo)
            Text("Lembrete de vacinas")
                .font(.custom(Font.SemiBold, size: 28))
            Text("Agende consultas, vacinas e medicamentos para nunca mais esquecer.")
                .font(.custom(Font.Regular, size: 13))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 35)
    }
}

struct OnBoardPageTwo_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardPageTwo()
    }
}
