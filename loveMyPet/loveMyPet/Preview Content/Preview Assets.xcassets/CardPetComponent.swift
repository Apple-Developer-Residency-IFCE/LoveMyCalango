//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct CardPet: View{
//    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    @Environment(\.colorScheme) var colorScheme
    
    let item: Pet

    var body: some View {
        HStack() {
            Image(item.image)
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.custom(Font.SemiBold, size: 17))
                    .padding(.bottom, 1)
                    .foregroundColor(Color("FontColor"))
                
                Text(item.breed)
                    .font(.custom(Font.Light, size: 15))
                    .foregroundColor(Color("FontColor"))
            }
            .padding(.leading, 16)
            
            Spacer()
            Image("IconArrow")
                .foregroundColor(.black.opacity(0.61))
                .padding(.trailing, 16)

        }
        .frame(height: 60)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("BorderCardPet"), lineWidth: 2)
        )
        .background(
        RoundedRectangle(cornerRadius: 12)
            .fill(Color("CardPetBackground")))
        .padding(.horizontal, 24)
    }
}


struct CardPet_Previews: PreviewProvider {
    static var previews: some View {
        CardPet(item: .init())
    }
}
