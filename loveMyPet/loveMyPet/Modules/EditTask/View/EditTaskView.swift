//
//  EditTaskView.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 20/07/23.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var editViewModel = EditTaskViewModel()
    @Binding var task: NewTask

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Título", text: $task.title)

                    Picker("Tipo de tarefa", selection: $task.type) {
                        ForEach(TaskType.allCases, id: \.self) { task in
                            Text(task.rawValue)
                        }
                    }

                    Picker("Pet", selection: $task.pet) {
                        Text("Nao escolhido")

                        ForEach(editViewModel.pets, id: \.id) { pet in
                            Text(pet.name).tag(pet as NewPet?)
                        }
                    }
                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))

                Section {
                    DateTimeInput(selectedDate: $task.date, selectedTime: $task.time)

                    Picker("Repetir", selection: $task.replay) {
                        ForEach(Replay.allCases, id: \.self) { replay in
                            Text(replay.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                    Picker("Lembrete", selection: $task.reminder) {
                        ForEach(Reminder.allCases, id: \.self) { reminder in
                            Text(reminder.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))

                Section {
                    TextField("Descrição", text: $task.summary, axis: .vertical)
                        .frame(width: 327, height: 200, alignment: .topLeading)
                        .font(.custom(Font.Regular, size: 16))
                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(Color(CustomColor.FontForm))
            .background(Color(CustomColor.BackgroundColor))

            RemoveButton(type: .task) {
                editViewModel.deleteTask(task: task)
            } dismiss: {
                dismiss()
            }

            Spacer()

        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editViewModel.updateTask(task: task)
                    dismiss()
                } label: {
                    Text(Constants.Home.save).font(.custom(Font.SemiBold, size: 16))
                }
                .tint(Color(CustomColor.MainColor))
            }
        })
        .onAppear {
            editViewModel.fetchAllPets()
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        @State var task = NewTask()
        EditTaskView(task: $task)
    }
}
