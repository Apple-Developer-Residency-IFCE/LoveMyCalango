//
//  CustomEditNavigation.swift
//  loveMyPet
//
//  Created by Ravi on 16/06/23.
//

import SwiftUI

struct CustomEditNavigation<Detail: View, Edit: View>: View {
    @Environment(\.dismiss) var dismiss
    @ViewBuilder let detailView: Detail
    @ViewBuilder let editView: Edit
    @State private var showingSheet = false
    var update: () -> Void
    var task: NewTask?

    var body: some View {
        detailView
            .navigationBarTitle(task != nil ? Text(task?.type.rawValue ?? "") :
                                    Text(Constants.Home.infoPetTitle), displayMode: .inline)
            .navigationBarBackButtonHidden(task != nil ? true : false)
            .toolbar {
                if task != nil {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            HStack(spacing: 5) {
                                Image(Assets.Icon.chevronLeft)
                                Text(Constants.Task.title)
                                    .foregroundColor(Color(CustomColor.MainColor))
                                    .font(.custom(Font.Regular, size: 16))
                            }

                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSheet = true
                    } label: {
                        Text(Constants.Home.edit)
                            .foregroundColor(Color(CustomColor.MainColor))
                            .font(.custom(Font.SemiBold, size: 16))
                    }
                }
            }
            .sheet(isPresented: $showingSheet, onDismiss: update) {
                NavigationView {
                    editView
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button {
                                    showingSheet = false
                                } label: {
                                    Text(Constants.Home.cancel)
                                        .foregroundColor(Color(CustomColor.MainColor))
                                        .font(.custom(Font.Regular, size: 16))
                                }
                            })
                        }
                        .toolbarBackground(Color(CustomColor.NavigationBackground), for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                }
            }
    }
}
