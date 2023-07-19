//
//  OnBoardViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 19/07/23.
//

import SwiftUI

final class OnBoardViewModel: ObservableObject {
    @AppStorage("showOnBoarding") var showOnBoarding: Bool = true
    @Published var currentTab: Int = 0
    @Published var rightText: String = Constants.OnBoard.onBoardRightButton
    @Published var isHidden: Bool = false

    func changeTabIndex() {
        if currentTab < 2 {
            currentTab += 1
        }
    }

    func changeRightText() {
        if currentTab == 2 {
            rightText = Constants.OnBoard.onBoardStartButton
        } else {
            rightText = Constants.OnBoard.onBoardRightButton
        }
    }

    func onBoardingToggle() {
        showOnBoarding.toggle()
    }
    
    func hideLeftButton() {
        if currentTab == 2 {
            isHidden = true
        } else {
            isHidden = false
        }
    }
}
