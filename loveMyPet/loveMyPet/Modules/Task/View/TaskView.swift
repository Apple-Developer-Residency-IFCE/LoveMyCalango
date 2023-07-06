//
//  TaskView.swift
//  loveMyPet
//
//  Created by José Winny on 28/06/23.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(CustomColor.BackGroundColor)
                    .ignoresSafeArea()

                VStack {
                    InlineCalendarPlaceholder()
                    Spacer()

                    Section {
                        PendingTasks()
                    } header: {
                        HStack {
                            Text("Tarefas pendentes")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }

                    Section {
                        CompletedTasks()
                    } header: {
                        HStack {
                            Label {
                                Text("Tarefas concluídas")
                                    .font(.title)
                                    .fontWeight(.bold)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(Assets.Image.namedLogo)
                        .padding(.horizontal)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(Assets.Icon.calendar)
                        .padding(.horizontal)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(Assets.Icon.add)
                }
            }
        }
    }
}

struct InlineCalendarPlaceholder: View {
    var body: some View {
        Text("Placeholder: Calendário")
    }
}

private struct PendingTasks: View {
    private var formatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter
    }()

    var body: some View {
        VStack {
            TaskCard(task: Task(title: "Dar o remédio de verme", alarm: .now, category: .medicine, assignee: Pet()))
            TaskCard(task: Task(title: "Vacinar o Bob", alarm: formatter.date(from: "05/07/2023 13:05")!, category: .vaccine, assignee: Pet()))
        }
    }
}

private struct CompletedTasks: View {
    private var formatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter
    }()

    var body: some View {
        VStack {
            TaskCard(task: Task(title: "Sair pra passear", alarm: formatter.date(from: "05/07/2023 22:31")!, category: .other, assignee: Pet()))
            TaskCard(task: Task(title: "Não sei kk", alarm: formatter.date(from: "05/07/2023 08:30")!, category: .hygiene, assignee: Pet()))
        }
    }
}

private struct TaskCard: View {
    var task: Task

    var body: some View {
        HStack {
            Information(title: task.title, category: task.category, alarm: task.alarm)

            Spacer()

            NameAndProfilePicture()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(CustomColor.BorderCardPet), lineWidth: 2)
        )
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(CustomColor.PetBackground))
        )
        .padding(.horizontal, 24)
        .padding(.vertical, 4)
    }
}

private struct Information: View {
    var title: String
    var category: TaskCategory
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
    var body: some View {
        VStack {
            ProfilePicture(item: NewPet())
            Text("Lua")  // TODO: Extract this value
                .fontWeight(.bold)
        }
    }
}

private struct ProfilePicture: View {
    var item: NewPet

    var body: some View {
        Image(uiImage: UIImage(data: item.image) ?? UIImage(named: Assets.Image.logo) ?? UIImage())
            .resizable()
            .frame(width: 64, height: 64)
            .clipShape(Circle())
    }
}

private struct AlarmTime: View {
    let alarm: Date  // We'll only need the time, though

    var body: some View {
        HStack {
            Image(systemName: "deskclock")  // TODO: Use actual asset
            Text(alarm, style: .time)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

// For debugging purposes
// This struct should be part of integrating Tasks to Core Data PR
private struct Task {
    var title: String
    var alarm: Date
    var category: TaskCategory
    var assignee: Pet  // I lack a better name
}

// This enum should be part of integrating Tasks to Core Data PR
private enum TaskCategory: String {
    case vaccine = "Vacina"
    case medicine = "Remédio"
    case leisure = "Lazer"
    case hygiene = "Higiene"
    case other = "Outros"
}
