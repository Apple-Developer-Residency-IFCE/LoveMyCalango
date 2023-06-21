//
//  HomeModifier.swift
//  loveMyPet
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct CustomHomeNavigation<Home: View, Add: View>: View {
    
    @ViewBuilder let homeView: Home
    @ViewBuilder let addView: Add
//    var customFunc: () -> Void
    
    @State private var showingPopover = false
    
    var body: some View {
            homeView
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showingPopover = true
                            } label: {
                                Text(Constants.Home.add)
                                    .foregroundColor(Color("MainColor"))
                                    .font(.custom(Font.SemiBold, size: 16))
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
//                                        customFunc()
                                        showingPopover = false
                                    } label: {
                                        Text(Constants.Home.add)
                                            .font(.custom(Font.SemiBold, size: 16))
                                    }
                                    .disabled(!Helper.shared.isAddBtnEnable)
                                    .tint(!Helper.shared.isAddBtnEnable ? Color.gray : Color("MainColor"))
                                })
                            }
                    }
                }
    }
}
