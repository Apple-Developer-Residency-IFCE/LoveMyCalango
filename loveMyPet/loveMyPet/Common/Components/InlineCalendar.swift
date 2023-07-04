//
//  InlineCalendar.swift
//  loveMyPet
//
//  Created by José Winny on 29/06/23.
//

import SwiftUI

struct InlineCalendar: View {
    let rows = [GridItem(.fixed(40))]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows ,alignment:.top, spacing: 1){
                ForEach(1...31, id: \.self) {
                    Text("\($0)")
                        .background(Color.gray)
                }
            }
        }
    }
}

struct InlineCalendar_Previews: PreviewProvider {
    static var previews: some View {
        InlineCalendar()
    }
}
