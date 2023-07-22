//
//  ConfigView.swift
//  loveMyPet
//
//  Created by Vitor Costa on 12/06/23.
//

import SwiftUI

struct ConfigView: View {
    @ObservedObject var viewModel = ConfigViewModel()
    var body: some View {

        VStack(alignment: .leading) {
            Text(Constants.Config.title)
                .font(.custom(Font.SemiBold, size: 32))
                .foregroundColor(Color(CustomColor.FontColor))
                .padding(.bottom, 32)

            Text(Constants.Config.appereance)
                .font(.custom(Font.SemiBold, size: 14))
                .foregroundColor(Color(CustomColor.FontColor))

            ConfigOptions(viewModel: viewModel)
                .padding(EdgeInsets(top: 20, leading: 8, bottom: 32, trailing: 0))

            Text(Constants.Config.sounds)
                .font(.custom(Font.SemiBold, size: 11))

            ZStack {
                Toggle(Constants.Config.notifications, isOn: $viewModel.isON)
                    .font(.custom(Font.Regular, size: 16))
                    .padding(.trailing, 24)
                    .padding(.leading, 16)
                    .tint(Color(CustomColor.toggleActiveColor))
                    .onChange(of: viewModel.isON) { newValue in
                        if newValue {
                            viewModel.allowNotification()
                        }
                    }
            }
            .frame(width: 327, height: 40, alignment: .center)
            .background(Color(CustomColor.White.whiteF4))
            .cornerRadius(12)

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 40)
        .padding(.leading, 24)
        .background(Color(CustomColor.BackgroundColor))
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
