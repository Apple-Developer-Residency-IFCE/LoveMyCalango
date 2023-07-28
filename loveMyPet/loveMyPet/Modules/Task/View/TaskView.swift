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
        ScrollView {
            VStack {
                if viewModel.showCuriosityCard {
                    CuriosityCard(title: Constants.Task.cardTitle, description: viewModel.catCuriosity)
                        .padding(.vertical)
                }

                InlineCalendar(listOfLetterDay: $viewModel.days, selectDay: $viewModel.today)
                    .frame(height: 84)

                if viewModel.tasks.isEmpty {
                    EmptyListView(type: .tasks, addSheet: $addSheet)
                } else {
                    VStack {
                        Section {
                            ForEach(viewModel.tasks.filter { $0.isDone == false }) { task in
                                NavigationLink(destination: Text("Stub location")) {
                                    SwipableCard {
                                        CoreDataManager.shared.deleteTask(task: task)
                                        viewModel.fetchAllTasks()
                                    } content: {
                                        Card {
                                            HStack {
                                                Information(title: task.title, category: task.type, alarm: task.time)

                                                Spacer()

                                                NameAndProfilePicture(pet: task.pet)
                                            }
                                        }
                                    } rightButton: {
                                        Button {
                                            CoreDataManager.shared.deleteTask(task: task)
                                            viewModel.fetchAllTasks()
                                        } label: {
                                            HStack {
                                                Spacer()
                                                Image(systemName: "trash")
                                                    .foregroundColor(.white)
                                                    .frame(minWidth: 80, maxHeight: .infinity)
                                            }
                                        }
                                        .background(Color.red)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                    }
                                }
                            }
                        } header: {
                            HStack {
                                Text("Tarefas Pendentes")
                                    .font(.custom(Font.SemiBold, size: 20))
                                    .textCase(nil)

                                Spacer()
                            }
                        }
                        .padding(.bottom)

                        Section {
                            ForEach(viewModel.tasks.filter { $0.isDone }) { task in
                                NavigationLink(destination: Text("Stub location")) {
                                    SwipableCard {
                                        CoreDataManager.shared.deleteTask(task: task)
                                        viewModel.fetchAllTasks()
                                    } content: {
                                        Card {
                                            HStack {
                                                Information(title: task.title, category: task.type, alarm: task.time)

                                                Spacer()

                                                NameAndProfilePicture(pet: task.pet)
                                            }
                                        }
                                    } rightButton: {
                                        Button {
                                            CoreDataManager.shared.deleteTask(task: task)
                                            viewModel.fetchAllTasks()
                                        } label: {
                                            HStack {
                                                Spacer()
                                                Image(systemName: "trash")
                                                    .foregroundColor(.white)
                                                    .frame(minWidth: 80, maxHeight: .infinity)
                                            }
                                        }
                                        .background(Color.red)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                    }
                                }
                            }
                        } header: {
                            HStack {
                                Label {
                                    Text("Tarefas concluídas")
                                        .font(.custom(Font.SemiBold, size: 20))
                                        .textCase(nil)
                                } icon: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(Color("HelperSuccess"))
                                }

                                Spacer()
                            }
                        }
                    }
                    .padding()
                }
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
    }
}

private struct Information: View {
    var title: String
    var category: TaskType
    var alarm: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.custom(Font.SemiBold, size: 18))
            Text(category.rawValue)
                .font(.custom(Font.Regular, size: 13))
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
                .font(.custom(Font.SemiBold, size: 13))
                .foregroundColor(Color(CustomColor.FontColor))
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
                .font(.custom(Font.Inter.Medium, size: 13))
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(addSheet: .constant(false))
            .environmentObject(TaskViewModel())
    }
}
