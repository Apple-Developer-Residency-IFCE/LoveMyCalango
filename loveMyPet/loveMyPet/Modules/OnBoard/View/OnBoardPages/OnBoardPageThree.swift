//
//  OnBoardPageThree.swift
//  loveMyPet
//
//  Created by Vitor Costa on 18/07/23.
//

import SwiftUI

struct OnBoardPageThree: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(Assets.Image.onBoardImageThree)
            Text("Organize rotinas")
                .font(.custom(Font.SemiBold, size: 28))
            Text("Organize as rotinas dos seus pets. Crie tarefas e as visualize em um calendário.")
                .font(.custom(Font.Regular, size: 13))
                .multilineTextAlignment(.center)
        }
        .padding(.top, 67.49)
        .padding(.horizontal, 35)
    }
}

struct OnBoardPageThree_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardPageThree()
    }
}
