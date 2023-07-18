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
        VStack {
            Button(action: {
                isDatePickerVisible.toggle()
            }){
                Image(Assets.Icon.calendar)
                    .resizable()
                    .frame(width: 30, height: 30)
            }.buttonStyle(.plain)
            .padding()
            if isDatePickerVisible {
                DatePicker("", selection: .constant(Date()), displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .accentColor(Color(CustomColor.MainColor))
                    .monospaced()
            }
        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
