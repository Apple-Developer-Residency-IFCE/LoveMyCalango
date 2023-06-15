//
//  HomeModifier.swift
//  loveMyPet
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct CustomHomeNavigation<Home: View, Edit: View>: View {
    
    @ViewBuilder let homeView: Home
    @ViewBuilder let editView: Edit
    @EnvironmentObject private var viewModel: EditPetViewModel
    
    @State private var showingPopover = false
    
    init(homeView: () -> Home, editView: () -> Edit) {
        self.homeView = homeView()
        self.editView = editView()
    }
    
    var body: some View {
        homeView
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if viewModel.selectedTab == .pets {
                        Button {
                            viewModel.createNewPet()
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
                    editView
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
