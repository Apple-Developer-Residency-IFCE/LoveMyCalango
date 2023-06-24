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
            .alert(Constants.Alert.deleteRegister,isPresented: $isShowing) {
                Button(Constants.Alert.delete) {
                    handleDelete()
                    isShowing = false
                }
                Button(Constants.Home.cancel, role: .cancel) { }
            } message: {
                Text(Constants.Alert.description)
            }
    }
}
