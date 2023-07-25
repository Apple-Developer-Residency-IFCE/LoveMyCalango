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
                            ForEach(viewModel.tasks.filter { $0.isDone == false }) { task in
                                Card {
                                    HStack {
                                        Information(title: task.title, category: task.type, alarm: task.time)

                                        Spacer()

                                        NameAndProfilePicture(pet: task.pet)
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
                            ForEach(viewModel.tasks.filter { $0.isDone }) { task in
                                Card {
                                    HStack {
                                        Information(title: task.title, category: task.type, alarm: task.time)

                                        Spacer()

                                        NameAndProfilePicture(pet: task.pet)
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
            Image("IconClock")
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
