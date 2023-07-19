//
//  SplashScreenView.swift
//  loveMyPet
//
//  Created by José Winny on 19/07/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(CustomColor.LaunchScreenBackground)
                .ignoresSafeArea()
            Image(Assets.Image.launchScreenSecond)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
