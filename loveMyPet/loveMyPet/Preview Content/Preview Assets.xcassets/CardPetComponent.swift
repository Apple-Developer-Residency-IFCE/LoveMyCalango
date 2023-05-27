//
//  CardPet.swift
//  loveMyPet
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct CardPet: View{

    let item: Pet 

    var body: some View {
        HStack() {
            Image(item.petImage)
                .resizable()
                .clipShape(Circle())
                .frame(width: 66,height: 100)
                .padding(.leading, -1)
                .padding(.trailing, 5)

            VStack(alignment: .leading) {
                Text(item.petName)
                    .font(.system(size: 17, weight: .bold))
                    .padding(.bottom,1)

                Text(item.petRace)
                    .font(.system(size: 15))
            }
            Spacer()
            Image(systemName: "arrow.right")
                .foregroundColor(.black.opacity(0.61))

        }
        .frame(width: UIScreen.main.bounds.size.width * 0.80,height: 60)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray.opacity(0.4), lineWidth: 2)
        )

    }


}


//struct CardPet_Previews: PreviewProvider {
//    static var previews: some View {
//        CardPet(item: Pet.init(id: UUID(), petName: "", petRace: "", petImage: ""))
//    }
//}


