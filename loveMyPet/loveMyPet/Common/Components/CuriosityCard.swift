//
//  CuriosityCard.swift
//  loveMyPet
//
//  Created by Vitor Costa on 30/06/23.
//

import SwiftUI

struct CuriosityCard: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Image(Assets.Image.CuriosityPetFace)
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color(CustomColor.MainColor))
                    .font(.custom(Font.SemiBold, size: 16))
                Text(description)
                    .font(.custom(Font.Regular, size: 13))
                    .multilineTextAlignment(TextAlignment.leading)
            }
            .padding(.vertical, 10)
            Spacer()
            
        }
        .frame(height: 141)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(CustomColor.BorderCardPet), lineWidth: 4)
        )
        .background(Color(CustomColor.PetBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 24)
    }
}

struct CuriosityCard_Previews: PreviewProvider {
    static var previews: some View {
        CuriosityCard(title: "Curiosidade do dia!", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent finibus vehicula tortor, varius pharetra nibh pharetra id. Sed id quam non nunc mollis condimentum eu et ligula. Aenean id ex lectus. Donec fermentum dui elit, id tincidunt nunc accumsan in. Quisque vestibulum lobortis sagittis. Vestibulum arcu felis, tincidunt in ex ac, cursus faucibus dui. Mauris sit amet neque ac nisi hendrerit lacinia non in est. Curabitur condimentum orci in sagittis ultrices.")
    }
}
