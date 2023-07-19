//
//  BottomButtons.swift
//  loveMyPet
//
//  Created by Vitor Costa on 19/07/23.
//

import SwiftUI

struct BottomButtons: View {
    @ObservedObject var viewModel: OnBoardViewModel

    var body: some View {
        HStack {
            Button {
                viewModel.onBoardingToggle()
            } label: {
                Text(Constants.OnBoard.onBoardLeftButton)
                    .foregroundColor(Color(CustomColor.MainColor))
                    .font(.custom(Font.SemiBold, size: 13.22))
            }
            .opacity(viewModel.isHidden ? 0 : 1)

            Spacer()
                .frame(width: 162.15)
            Button {
                viewModel.changeTabIndex()
                viewModel.changeRightText()
                viewModel.hideLeftButton()
            } label: {
                Text(viewModel.rightText)
                    .font(.custom(Font.SemiBold, size: 16))
                    .foregroundColor(.white)
            }
            .frame(width: 120, height: 41)
            .background(Color(CustomColor.MainColor))
            .clipShape(RoundedRectangle(cornerRadius: 7))
        }
    }
}

struct BottomButtons_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtons(viewModel: OnBoardViewModel())
    }
}
