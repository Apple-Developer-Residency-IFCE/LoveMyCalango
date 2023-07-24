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
    @Binding var addSheet: Bool

    var body: some View {
            ZStack {
                Color(CustomColor.BackgroundColor)
                    .ignoresSafeArea()
                VStack {
                    CuriosityCard(title: Constants.Task.cardTitle, description: viewModel.catCuriosity)
                        .padding(.vertical)
                    Text("Tarefa")
                    InlineCalendar(listOfLetterDay: $listOfLetterDay, selectDay: $today)
                        .frame(height: 84)
                Spacer()

                    if viewModel.tasks.isEmpty {
                        EmptyListView(type: .tasks, addSheet: $addSheet)
                    }
                }
            }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(addSheet: .constant(false))
            .environmentObject(TaskViewModel())
    }
}
