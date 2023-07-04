//
//  AlertMessage.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AlertMessageBuilder: ViewModifier {
    @Binding var isShowing: Bool
    var handleDelete: () -> Void

    func body(content: Content) -> some View {
        content
            .alert(Constants.Alert.deleteRegister, isPresented: $isShowing) {
                Button(role: .destructive) {
                    handleDelete()
                    isShowing = false
                } label: {
                    Text(Constants.Alert.delete)
                        .foregroundColor(Color(CustomColor.DeleteAlert))
                }

                Button(role: .cancel) {
                    // No action
                } label: {
                    Text(Constants.Home.cancel)
                        .foregroundColor(Color(CustomColor.MainColor))
                }
            } message: {
                Text(Constants.Alert.description)
                    .foregroundColor(Color(CustomColor.FontColor))
            }
    }
}
