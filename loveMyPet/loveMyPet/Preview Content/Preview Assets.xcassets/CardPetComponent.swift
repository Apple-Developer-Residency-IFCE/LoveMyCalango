//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct CardPet: View{
    static let mockPet = Pet(petName: "Bud", petRace: "Rusky Siberiano", petImage: "teste1")

    let item: Pet

    var body: some View {
        HStack() {
            Image(item.petImage)
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(item.petName)
                    .font(.system(size: 17, weight: .bold))
                    .padding(.bottom,1)

                Text(item.petRace)
                    .font(.system(size: 15))
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.black.opacity(0.61))

        }
        .frame(height: 60)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray.opacity(0.4), lineWidth: 2)
        )
    }
}


struct CardPet_Previews: PreviewProvider {
    static var previews: some View {
        CardPet(item: CardPet.mockPet)
    }
}


