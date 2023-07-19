//
//  OnBoardViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 19/07/23.
//

import Foundation

final class OnBoardViewModel: ObservableObject {
    @Published var currentTab: Int = 0
    @Published var rightText: String = Constants.OnBoard.onBoardRightButton

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
}
