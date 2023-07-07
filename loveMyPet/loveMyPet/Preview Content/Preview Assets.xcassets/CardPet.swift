//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct CardPet: View {

    var item: NewPet
    let teste = LocalFileManager.instance

    var body: some View {
        HStack {
            Image(uiImage: teste.loadImageFromDiskWith(fileName: item.name)
                  ?? UIImage(named: Assets.Image.logo)
                  ?? UIImage())
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.custom(Font.SemiBold, size: 17))
                    .padding(.bottom, 1)
                    .foregroundColor(Color(CustomColor.FontColor))

                Text(item.breed)
                    .font(.custom(Font.Light, size: 15))
                    .foregroundColor(Color(CustomColor.FontColor))
                    .padding(.leading, 2)
            }
            .padding(.leading, 16)

            Spacer()
            Image(Assets.Icon.arrow)
                .foregroundColor(.black.opacity(0.61))
                .padding(.trailing, 16)

        }
        .frame(height: 60)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(CustomColor.BorderCardPet), lineWidth: 2)
        )
        .background(
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(CustomColor.PetBackground)))
        .padding(.horizontal, 24)
    }
}
