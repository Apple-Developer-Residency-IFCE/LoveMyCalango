//
//  TaskView.swift
//  loveMyPet
//
//  Created by José Winny on 28/06/23.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var viewModel: TaskViewModel
    @Binding var addSheet: Bool

    var body: some View {
            ZStack {
                Color(CustomColor.BackgroundColor)
                    .ignoresSafeArea()
                VStack {
                    if viewModel.showCuriosityCard {
                        CuriosityCard(title: Constants.Task.cardTitle, description: viewModel.catCuriosity)
                            .padding(.vertical)
                    }
                    Text("Tarefa")
                    InlineCalendar(listOfLetterDay: $viewModel.days, selectDay: $viewModel.today)
                        .frame(height: 84)
                Spacer()

                    if viewModel.tasks.isEmpty {
                        EmptyListView(type: .tasks, addSheet: $addSheet)
                    }
                }
            }
            .onAppear {
                viewModel.curiosityCardBuildComponent()
            }
        }
    }

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(addSheet: .constant(false))
            .environmentObject(TaskViewModel())
    }
}
