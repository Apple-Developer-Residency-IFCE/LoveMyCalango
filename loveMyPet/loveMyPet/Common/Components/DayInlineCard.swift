//
//  DayInlineCard.swift
//  loveMyPet
//
//  Created by José Winny on 03/07/23.
//

import SwiftUI

struct DayInlineCard: View {
    let letterDay: String = "S"
    let numberDay: Int = 1
    var isSelected: Bool = true
    
    var body: some View {
        VStack {
            Text(letterDay)
                .padding(.bottom,8)
            Text("\(numberDay)")
        }
        .frame(width: 39, height: 64)
        .padding(EdgeInsets(top: 8, leading: 4, bottom: 8, trailing: 4))
        .foregroundColor(isSelected ? Color("White-F4F3FA") : Color("FontColor"))
        .background(isSelected ? Color("MainColor") : Color(""))
        .cornerRadius(4)
        .id(numberDay)
    }
}

struct DayInlineCard_Previews: PreviewProvider {
    static var previews: some View {
        DayInlineCard()
    }
}
