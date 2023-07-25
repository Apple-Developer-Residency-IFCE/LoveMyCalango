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
                } else {
                    List {
                        Section {
                            //
                        } header: {
                            Text("Tarefas Pendentes")
                                .font(.title)
                                .fontWeight(.bold)
                                .textCase(nil)
                        }

                        Section {
                            //
                        } header: {
                            Label {
                                Text("Tarefas concluídas")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .textCase(nil)
                            } icon: {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(Color("HelperSuccess"))
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.curiosityCardBuildComponent()
        }
    }
}

struct Card<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(CustomColor.BorderCardPet), lineWidth: 2)
            )
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(CustomColor.PetBackground))
            )
            .padding(.vertical, 4)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(addSheet: .constant(false))
            .environmentObject(TaskViewModel())
    }
}
