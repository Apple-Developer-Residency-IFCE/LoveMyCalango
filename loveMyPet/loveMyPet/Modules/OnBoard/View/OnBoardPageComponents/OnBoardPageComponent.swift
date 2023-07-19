//
//  OnBoardPageComponent.swift
//  loveMyPet
//
//  Created by Vitor Costa on 19/07/23.
//

import SwiftUI

struct OnBoardPageComponent: View {
    let onBoardInfos: OnBoardModel

    var body: some View {
        VStack(alignment: .center) {
            Image(onBoardInfos.image)
            Text(onBoardInfos.title)
                .font(.custom(Font.SemiBold, size: 28))
            Text(onBoardInfos.description)
                .font(.custom(Font.Regular, size: 13))
                .multilineTextAlignment(.center)
        }
        .padding(.top, onBoardInfos.topPadding)
            .padding(.horizontal, 35)
    }
}

struct OnBoardPageComponent_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardPageComponent(onBoardInfos: OnBoardModel.list[2])
    }
}
