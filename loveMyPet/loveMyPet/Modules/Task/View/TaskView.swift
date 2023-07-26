//
//  TaskView.swift
//  loveMyPet
//
//  Created by José Winny on 28/06/23.
//

import SwiftUI

struct TaskView: View {
    @State var listOfLetterDay: [String] = TaskViewModel().days
    @State var today: Int = TaskViewModel().today
    @EnvironmentObject var viewModel: TaskViewModel

    var body: some View {
        if !viewModel.showCalendar {
            ZStack {
                Color(CustomColor.BackgroundColor)
                    .ignoresSafeArea()
                VStack {
                    CuriosityCard(title: Constants.Task.cardTitle, description: viewModel.catCuriosity)
                        .padding(.vertical)
                    InlineCalendar(listOfLetterDay: $listOfLetterDay, selectDay: $today)
                        .frame(height: 84)
                    Spacer()
                }
            }
        } else {
            CustomDatePicker()
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(TaskViewModel())
    }
}
