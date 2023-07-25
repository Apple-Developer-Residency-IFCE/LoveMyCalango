//
//  AddTaskView.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 17/07/23.
//

import SwiftUI

struct AddTaskView: View {
    @StateObject var addViewModel =  AddTaskViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(Constants.TaskForm.title, text: $addViewModel.title)

                    Picker(Constants.TaskForm.type, selection: $addViewModel.type) {
                        ForEach(TaskType.allCases, id: \.self) { task in
                            Text(task.rawValue)
                        }
                    }

                    Picker(Constants.TaskForm.pet, selection: $addViewModel.selectedPet) {
                        Text("Nao escolhido")

                        ForEach(addViewModel.pets, id: \.id) { pet in
                            Text(pet.name).tag(pet as NewPet?)
                        }
                    }

                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))

                Section {
                    DateTimeInput(selectedDate: $addViewModel.selectedDate, selectedTime: $addViewModel.selectedTime)

                    Picker(Constants.TaskForm.replay, selection: $addViewModel.replay) {
                        ForEach(Replay.allCases, id: \.self) { replay in
                            Text(replay.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                    Picker(Constants.TaskForm.remember, selection: $addViewModel.reminder) {
                        ForEach(Reminder.allCases, id: \.self) { reminder in
                            Text(reminder.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))

                Section {
                    TextField(Constants.TaskForm.summary, text: $addViewModel.summary, axis: .vertical)
                        .frame(width: 327, height: 200, alignment: .topLeading)
                        .font(.custom(Font.Regular, size: 16))
                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(Color(CustomColor.FontForm))
            .background(Color(CustomColor.BackgroundColor))
        }
        .onAppear {
            addViewModel.fetchAllPets()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button {
                    addViewModel.createTask()
                    dismiss()
                } label: {
                    Text(Constants.Home.add)
                        .font(.custom(Font.SemiBold, size: 16))
                }
                .disabled(!addViewModel.isFormValid)
                .tint(addViewModel.isFormValid ? Color(CustomColor.MainColor) : Color.gray )
            })
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
