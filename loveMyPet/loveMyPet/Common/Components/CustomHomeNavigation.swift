//
//  HomeModifier.swift
//  loveMyPet
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct CustomHomeNavigation<Home: View, Add: View>: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    @ViewBuilder let homeView: Home
    @ViewBuilder let addView: Add
    @Binding private var selectedTab: TabContextView
    @State private var showingPopover = false
    
    init(selectedTab: Binding<TabContextView>?, homeView: () -> Home, addView: () -> Add) {
        self.homeView = homeView()
        self.addView = addView()
        self._selectedTab = selectedTab ?? .constant(.pets)
    }
    
    var body: some View {
        homeView
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if selectedTab == .pets {
                        Button {
                            showingPopover = true
                        } label: {
                            Text(Constants.Home.add)
                                .foregroundColor(Color("MainColor"))
                                .font(.custom(Font.SemiBold, size: 16))
                        }
                    }
                }
            }
            .popover(isPresented: $showingPopover) {
                NavigationView {
                    addView
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button {
                                    showingPopover = false
                                } label: {
                                    Text(Constants.Home.cancel)
                                        .foregroundColor(Color("MainColor"))
                                        .font(.custom(Font.Regular, size: 16))
                                }
                            })
                            ToolbarItem(placement: .navigationBarTrailing, content: {
                                Button {
                                    viewModel.addPet()
                                    showingPopover = false
                                } label: {
                                    Text(Constants.Home.add)
                                        .font(.custom(Font.SemiBold, size: 16))
                                }
                                .disabled(!viewModel.addBtnIsEnable)
                                .tint(!viewModel.addBtnIsEnable ? Color.gray : Color("MainColor"))
                            })
                        }
                }
                
            }
    }
}
