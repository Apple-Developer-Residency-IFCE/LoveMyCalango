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
                Image(isDatePickerVisible ? Assets.Icon.selectedCalendar : Assets.Icon.calendar)
                    .resizable()
                    .frame(width: isDatePickerVisible ? 45 : 30)
                    .frame(height: isDatePickerVisible ? 45 : 30)
            }.buttonStyle(.plain)
//            .padding()
            if isDatePickerVisible {
                DatePicker("", selection: .constant(Date()), displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .accentColor(Color(CustomColor.MainColor))
                    .monospaced()
                    .background(Color(CustomColor.White.whiteF4))
                    .cornerRadius(12)
//                    .offset(x: -170)
            }
        }
//        ScrollView {
//            CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
//        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
