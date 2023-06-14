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
    
    @Binding private var selectedTab: TabContextView
    @State private var showingPopover = false
    
    init(selected: Binding<TabContextView> ,homeView: () -> Home, editView: () -> Edit) {
        self.homeView = homeView()
        self.editView = editView()
        self._selectedTab = selected
    }
    
    var body: some View {
        homeView
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if selectedTab == .pets {
                        Button {
                            showingPopover = true
                        } label: {
                            Text(Constants.App.add)
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
                                    Text(Constants.App.cancel)
                                        .foregroundColor(Color("MainColor"))
                                        .font(.custom(Font.Regular, size: 16))
                                }
                            })
                            ToolbarItem(placement: .navigationBarTrailing, content: {
                                Button {
                                    print(Constants.Home.addPetTitle)
                                } label: {
                                    Text(Constants.App.add)
                                        .foregroundColor(Color("MainColor"))
                                        .font(.custom(Font.SemiBold, size: 16))
                                }
                            })
                        }
                }
                
            }
    }
}
