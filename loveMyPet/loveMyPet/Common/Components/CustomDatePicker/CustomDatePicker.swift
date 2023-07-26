//
//  CustomDatePicker.swift
//  loveMyPet
//
//  Created by José Winny on 17/07/23.
//

import SwiftUI

struct CustomDatePicker: View {
    @State var selectDate: Date = Date.now
    @State var isDatePickerVisible = false
    var body: some View {
        GeometryReader { _ in
            DatePicker("", selection: .constant(Date()), displayedComponents: .date)
                .datePickerStyle(.graphical)
                .accentColor(Color(CustomColor.MainColor))
                .monospaced()
                .background(Color(CustomColor.White.whiteF4))
            .cornerRadius(12)
        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
