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
                    TextField("Título", text: $addViewModel.title)

                    Picker("Tipo de tarefa", selection: $addViewModel.type) {
                        ForEach(TaskType.allCases, id: \.self) { task in
                            Text(task.rawValue)
                        }
                    }

                    Picker("Pet", selection: $addViewModel.selectedPet) {
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

                    Picker("Repetir", selection: $addViewModel.replay) {
                        ForEach(Replay.allCases, id: \.self) { replay in
                            Text(replay.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                    Picker("Lembrete", selection: $addViewModel.reminder) {
                        ForEach(Reminder.allCases, id: \.self) { reminder in
                            Text(reminder.rawValue)
                        }
                    }.font(.custom(Font.Regular, size: 16))

                }
                .listRowBackground(Color(CustomColor.PickerSection))
                .font(.custom(Font.Regular, size: 16))

                Section {
                    TextField("Descrição", text: $addViewModel.summary, axis: .vertical)
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
