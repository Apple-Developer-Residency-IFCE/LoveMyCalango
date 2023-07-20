//
//  SwiftUIView.swift
//  loveMyPet
//
//  Created by Vitor Costa on 18/07/23.
//

import SwiftUI
import UIKit

struct OnBoardView: View {
    @ObservedObject var viewModel = OnBoardViewModel()
    @State private var animate: Bool = true

    init () {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color(CustomColor.MainColor))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView(selection: $viewModel.currentTab) {
                    ForEach(OnBoardModel.list) {
                        OnBoardPageComponent(onBoardInfos: $0)
                            .tag($0.id)
                            .offset(y: animate ? 20 : 0)
                            .onAppear {
                                withAnimation(.easeOut(duration: 0.5)) {
                                    animate = false
                                }
                            }
                    }
                }
                .onChange(of: viewModel.currentTab, perform: { _ in
                    viewModel.changeRightText()
                    viewModel.hideLeftButton()
                })
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(.page)
                .padding(.top, geometry.size.height * 0.11)
                .transition(.slide)

                BottomButtons(viewModel: viewModel)
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
