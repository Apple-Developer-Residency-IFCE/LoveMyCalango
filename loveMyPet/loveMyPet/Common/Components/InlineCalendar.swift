//
//  InlineCalendar.swift
//  loveMyPet
//
//  Created by José Winny on 29/06/23.
//

import SwiftUI

struct InlineCalendar: View {
    @Binding var listOfLetterDay: [String]
    let today = Calendar.current.component(.day, from: Date())
    let rows = [GridItem(.fixed(40))]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { roller in
                LazyHGrid(rows: rows ,alignment:.top, spacing: 1){
                    ForEach(1...listOfLetterDay.count, id: \.self) { day in
                        DayInlineCard(letterDay: listOfLetterDay[day - 1], numberDay: day, isSelected: day == today)
                    }
                }
                .onAppear{
                    roller.scrollTo(today, anchor: .center)
                }
            }
        }
        
    }
}

//struct InlineCalendar_Previews: PreviewProvider {
//    static var previews: some View {
//        InlineCalendar()
//    }
//}
