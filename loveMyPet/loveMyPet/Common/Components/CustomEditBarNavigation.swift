//
//  CustomEditBarNavigation.swift
//  loveMyPet
//
//  Created by Ravi on 16/06/23.
//

import SwiftUI

struct CustomEditBarNavigation<Detail: View, Edit: View>: View {
    
    @ViewBuilder let detailPet: Detail
    @ViewBuilder let editView: Edit
    @State private var showingPopover = false
    
    var body: some View {
        detailPet
            .navigationTitle(Constants.Home.detail)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingPopover = true
                    } label: {
                        Text(Constants.Home.edit)
                            .foregroundColor(Color("MainColor"))
                            .font(.custom(Font.SemiBold, size: 16))
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
                        }
                }
            }
    }
}
