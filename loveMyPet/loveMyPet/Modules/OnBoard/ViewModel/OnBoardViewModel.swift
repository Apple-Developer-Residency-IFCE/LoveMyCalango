//
//  OnBoardViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 19/07/23.
//

import Foundation

final class OnBoardViewModel: ObservableObject {
    @Published var currentTab: Int = 0
    @Published var rightText: String = "Avançar"
    
    
}
