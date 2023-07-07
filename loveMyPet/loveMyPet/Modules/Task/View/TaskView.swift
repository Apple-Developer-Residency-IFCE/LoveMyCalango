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
            ScrollView {
                VStack {
                    InlineCalendarPlaceholder()
                    Spacer()

                    Section {
                        PendingTasks()
                    } header: {
                        Text("Tarefas pendentes")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Section {
                        CompletedTasks()
                    } header: {
                        Label {
                            Text("Tarefas concluídas")
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } icon: {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(Color("HelperSuccess"))
                        }
                    }
                }
                .padding(.horizontal, 24)
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
            TaskCard(task: Task(title: "Dar o remédio de verme",
                                alarm: .now,
                                category: .medicine,
                                assignee: {
                                    let pet = NewPet()
                                    pet.name = "Lua"
                                    return pet
                                }()
                               ))
            TaskCard(task: Task(title: "Vacinar o Bob",
                                alarm: formatter.date(from: "05/07/2023 13:05")!,
                                category: .vaccine,
                                assignee: {
                                    let pet = NewPet()
                                    pet.name = "Bob"
                                    return pet
                                }()
                               ))
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
            TaskCard(task: Task(title: "Sair pra passear",
                                alarm: formatter.date(from: "05/07/2023 22:31")!,
                                category: .other,
                                assignee: {
                                    let pet = NewPet()
                                    pet.name = "Hugo"
                                    return pet
                                }()
                               ))
            TaskCard(task: Task(title: "Não sei kk",
                                alarm: formatter.date(from: "05/07/2023 08:30")!,
                                category: .hygiene,
                                assignee: {
                                    let pet = NewPet()
                                    pet.name = "Bud"
                                    return pet
                                }()
                               ))
        }
    }
}

private struct TaskCard: View {
    var task: Task

    var body: some View {
        HStack {
            Information(title: task.title, category: task.category, alarm: task.alarm)

            Spacer()

            NameAndProfilePicture(pet: task.assignee)
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
        TaskView()
    }
}

// For debugging purposes
// This struct should be part of integrating Tasks to Core Data PR
private struct Task {
    var title: String
    var alarm: Date
    var category: TaskCategory
    var assignee: NewPet  // I lack a better name
}

// This enum should be part of integrating Tasks to Core Data PR
private enum TaskCategory: String {
    case vaccine = "Vacina"
    case medicine = "Remédio"
    case leisure = "Lazer"
    case hygiene = "Higiene"
    case other = "Outros"
}
