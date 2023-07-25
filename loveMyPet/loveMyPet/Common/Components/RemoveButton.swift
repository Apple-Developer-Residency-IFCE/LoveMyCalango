//
//  RemoveButton.swift
//  loveMyPet
//
//  Created by Ravi navarro on 03/06/23.
//

import SwiftUI

struct RemoveButton: View {
    @State var showAlert: Bool = false
    var type: RemoveButtonType
    var deleteFunc: () -> Void
    var dismiss: () -> Void

    var body: some View {
        Button {
            showAlert.toggle()
        } label: {
            ZStack {
                Color("Red-D12929")
                Text(type == .pet ? Constants.Home.deletePet : Constants.Task.deleteTaskTitle)
                    .foregroundColor(.white)
                    .font(.custom(Font.SemiBold, size: 16))
            }
            .frame(height: 50)
            .cornerRadius(10)
            .padding(.horizontal, 24)
        }
        .modifier(
            AlertMessageBuilder(isShowing: $showAlert, type: type, handleDelete: {
                deleteFunc()
                dismiss()
            }))
    }
}
