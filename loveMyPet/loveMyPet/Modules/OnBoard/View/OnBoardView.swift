//
//  SwiftUIView.swift
//  loveMyPet
//
//  Created by Vitor Costa on 18/07/23.
//

import SwiftUI
import UIKit

struct OnBoardView: View {

    init () {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color(CustomColor.MainColor))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }

    @State private var currentTab = 0
    @State private var rightText = "Avançar"

    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView(selection: $currentTab) {
                    OnBoardPageOne()
                        .tag(0)
                    OnBoardPageTwo()
                        .tag(1)
                    OnBoardPageThree()
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(.page)
                .padding(.top, geometry.size.height * 0.11)

                HStack {
                    Button {

                        print("Apertei")
                    } label: {
                        Text("Pular")
                            .foregroundColor(Color(CustomColor.MainColor))
                            .font(.custom(Font.SemiBold, size: 13.22))
                    }

                    Spacer()
                        .frame(width: 162.15)
                    Button {
                        if currentTab != 2 {
                            rightText = "Avançar"
                            currentTab += 1
                        }

                        if currentTab == 2 {
                            rightText = "Começar"
                        }
                    } label: {
                        Text(rightText)
                            .font(.custom(Font.SemiBold, size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(width: 120, height: 41)
                    .background(Color(CustomColor.MainColor))
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                }
                .padding(.bottom, geometry.size.height * 0.08)
            }
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
// https://dev.to/domanovdev/swiftui-onboarding-view-1165
