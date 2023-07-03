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

                    PendingTasks()
                    Spacer()
                    CompletedTasks()
                    Spacer()
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

struct TaskCard: View {
    var body: some View {
        HStack {
            Information()

            Spacer()

            NameAndProfilePicture()
        }
//        .frame(height: 60)
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
    }
}

private struct PendingTasks: View {
    var body: some View {
        Text("Placeholder: Tarefas pendentes")
    }
}

private struct CompletedTasks: View {
    var body: some View {
        VStack {
            Text("Tarefas concluídas")
            TaskCard()
        }
    }
}

private struct TimePlaceholder: View {
    var body: some View {
        Text("Placeholder: Horário")
    }
}

private struct Information: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sair pra passear")
                .font(.title2)
                .bold()
            Text("Outros")
            TimePlaceholder()
        }
    }
}

private struct NameAndProfilePicture: View {
    var body: some View {
        VStack {
            ProfilePicture(item: NewPet())
            Text("Lua")
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

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
