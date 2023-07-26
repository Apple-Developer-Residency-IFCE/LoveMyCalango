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
        GeometryReader { _ in
            ScrollView {
                VStack {
                    if viewModel.showCuriosityCard {
                        CuriosityCard(title: Constants.Task.cardTitle, description: viewModel.catCuriosity)
                            .padding(.vertical)
                    }

                    InlineCalendar(listOfLetterDay: $viewModel.days, selectDay: $viewModel.today)
                        .frame(height: 84)

//                    if viewModel.tasks.isEmpty {
//                        EmptyListView(type: .tasks, addSheet: $addSheet)
//                    } else {
                        VStack {
                            Section {
//                                ForEach(viewModel.tasks.filter { $0.isDone == false }) { task in
                                ForEach(DEBUG_generateTasks().filter { $0.isDone == false }) { task in
                                    NavigationLink(destination: Text("Stub location")) {
                                        Card {
                                            HStack {
                                                Information(title: task.title, category: task.type, alarm: task.time)

                                                Spacer()

                                                NameAndProfilePicture(pet: task.pet)
                                            }
                                        }
                                    }
                                }
                            } header: {
                                Text("Tarefas Pendentes")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .textCase(nil)
                            }

                            Section {
//                                ForEach(viewModel.tasks.filter { $0.isDone }) { task in
                                ForEach(DEBUG_generateTasks().filter { $0.isDone }) { task in
                                    NavigationLink(destination: Text("Stub location")) {
                                        Card {
                                            HStack {
                                                Information(title: task.title, category: task.type, alarm: task.time)

                                                Spacer()

                                                NameAndProfilePicture(pet: task.pet)
                                            }
                                        }
                                    }
                                }
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
                        .padding()
//                    }
                }
                .background(
                    Color(CustomColor.BackgroundColor)
                        .ignoresSafeArea()
                )
                .onAppear {
                    viewModel.curiosityCardBuildComponent()
                }
            }
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

private struct Information: View {
    var title: String
    var category: TaskType
    var alarm: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .bold()
            Text(category.rawValue)
            AlarmTime(alarm: alarm)
        }
        .foregroundColor(Color(CustomColor.FontColor))
    }
}

private struct NameAndProfilePicture: View {
    var pet: NewPet

    var body: some View {
        VStack {
            ProfilePicture(pet: pet)
            Text(pet.name)
                .fontWeight(.bold)
        }
    }
}

private struct ProfilePicture: View {
    var pet: NewPet

    var body: some View {
        Image(uiImage: UIImage(data: pet.image) ?? UIImage(named: Assets.Image.logo) ?? UIImage())
            .resizable()
            .frame(width: 64, height: 64)
            .clipShape(Circle())
    }
}

private struct AlarmTime: View {
    let alarm: Date  // We'll only need the time, though

    var body: some View {
        HStack {
            Image("IconCircleClock")
            Text(alarm, style: .time)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(addSheet: .constant(false))
            .environmentObject(TaskViewModel())
    }
}

func DEBUG_generateTasks() -> [NewTask] {
    let task1 = NewTask()
    task1.title = "Dar banho no Bob 1"
    task1.isDone = false

    let task2 = NewTask()
    task2.title = "Dar banho no Bob 2"
    task2.isDone = false

    let task3 = NewTask()
    task3.title = "Dar banho no Bob 3"
    task3.isDone = true

    let task4 = NewTask()
    task4.title = "Dar banho no Bob 4"
    task4.isDone = true

    let task5 = NewTask()
    task5.title = "Dar banho no Bob 5"
    task5.isDone = true

    return [task1, task2, task3, task4, task5]
}
