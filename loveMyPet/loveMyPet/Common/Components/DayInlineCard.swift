//
//  DayInlineCard.swift
//  loveMyPet
//
//  Created by José Winny on 03/07/23.
//

import SwiftUI

struct DayInlineCard: View {
    @State var letterDay: String = "D"
    @State var numberDay: Int = 1
    @State var isSelected: Bool = false
    
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
        DayInlineCard(letterDay: "S", numberDay: 1, isSelected: true)
    }
}
