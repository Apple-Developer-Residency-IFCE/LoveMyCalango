//
//  EmptyListView.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 19/07/23.
//

import SwiftUI

struct EmptyListView: View {
    var type: EmptyType
    @Binding var addSheet: Bool

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 22) {
                Image(Assets.Image.lazyCat)

                VStack {
                    Text(type == .pets ? Constants.Home.emptyPetSemibold : Constants.Task.emptyTaskSemibold)
                        .font(.custom(Font.SemiBold, size: 16))
                    Text(type == .pets ? Constants.Home.emptyPetRegular : Constants.Task.emptyTaskRegular)
                        .font(.custom(Font.Regular, size: 14))
                }
                .foregroundColor(Color(CustomColor.FontColor))
                .multilineTextAlignment(.center)
                .frame(width: 310, alignment: .top)

                Button {
                    addSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text(type == .pets ? Constants.Home.addPetTitle : Constants.Task.addTaskTitle)
                    }
                    .font(.custom(Font.SemiBold, size: 16))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 40)
                    .background(Color(CustomColor.MainColor))
                    .foregroundColor(Color(CustomColor.FontColor))
                    .cornerRadius(8)
                }
            }
            Spacer()
        }.frame(maxWidth: .infinity)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(type: .pets, addSheet: .constant(false))
    }
}
