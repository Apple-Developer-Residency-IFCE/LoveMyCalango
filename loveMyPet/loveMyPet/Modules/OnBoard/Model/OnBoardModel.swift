//
//  OnBoardModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 18/07/23.
//

import Foundation
struct OnBoardModel: Hashable, Identifiable {
    let id: Int
    let image: String
    let title: String
    let description: String
    let topPadding: CGFloat?

    static let list: [OnBoardModel] = [
        OnBoardModel(id: 0,
                     image: Assets.Image.onBoardImageOne,
                     title: Constants.OnBoard.onBoardPageOneTitle,
                     description: Constants.OnBoard.onBoardPageOneDescription,
                     topPadding: 0.0),
        OnBoardModel(id: 1,
                     image: Assets.Image.onBoardImageTwo,
                     title: Constants.OnBoard.onBoardPageTwoTitle,
                     description: Constants.OnBoard.onBoardPageTwoDescription,
                     topPadding: 0.0),
        OnBoardModel(id: 2,
                     image: Assets.Image.onBoardImageThree,
                     title: Constants.OnBoard.onBoardPageThreeTitle,
                     description: Constants.OnBoard.onBoardPageThreeDescription,
                     topPadding: 67.49)
    ]
}
