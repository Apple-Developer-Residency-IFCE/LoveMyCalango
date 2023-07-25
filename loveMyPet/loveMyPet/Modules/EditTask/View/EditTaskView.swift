//
//  EditTaskView.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 20/07/23.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var editViewModel: EditTaskViewModel

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(Constants.TaskForm.title, text: $editViewModel.task.title)

                    Picker(Constants.TaskForm.type, selection: $editViewModel.task.type) {
                        ForEach(TaskType.allCases, id: \.self) { task in
                            Text(task.rawValue)
                        }
                    }

                    Picker(Constants.TaskForm.pet, selection: $editViewModel.task.pet) {
                        ForEach(editViewModel.pets, id: \.id) { pet in
                            Text(pet.name).tag(pet as NewPet)
                        }
                    }
                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))

                Section {
                    DateTimeInput(selectedDate: $editViewModel.task.date, selectedTime: $editViewModel.task.time)

                    Picker(Constants.TaskForm.replay, selection: $editViewModel.task.replay) {
                        ForEach(Replay.allCases, id: \.self) { replay in
                            Text(replay.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                    Picker(Constants.TaskForm.remember, selection: $editViewModel.task.reminder) {
                        ForEach(Reminder.allCases, id: \.self) { reminder in
                            Text(reminder.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))

                Section {
                    TextField(Constants.TaskForm.summary, text: $editViewModel.task.summary, axis: .vertical)
                        .frame(width: 327, height: 200, alignment: .topLeading)
                        .font(.custom(Font.Regular, size: 16))
                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(Color(CustomColor.FontForm))

            RemoveButton(type: .task) {
                editViewModel.deleteTask()
            } dismiss: {
                dismiss()
            }

            Spacer()
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    editViewModel.updateTask()
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
        .background(Color(CustomColor.BackgroundColor))
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        @State var task = NewTask()
        EditTaskView(editViewModel: EditTaskViewModel(task: task))
    }
}
