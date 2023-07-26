//
//  CustomTaskNavigation.swift
//  loveMyPet
//
//  Created by José Winny on 03/07/23.
//

import SwiftUI

struct CustomTaskNavigation <TaskView: View, AddTask: View>: View {
    @ViewBuilder let taskListView: TaskView
    @ViewBuilder let addTaskView: AddTask
    @State private var showingPopover = false
    @ObservedObject var viewModel: TaskViewModel = TaskViewModel()
    var update: () -> Void

    var body: some View {
        NavigationView {
            taskListView
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(Assets.Image.namedLogo)
                            .padding(.horizontal)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(Assets.Icon.add)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.toogleCalendar()
                        }) {
                            Image(viewModel.showCalendar ? Assets.Icon.selectedCalendar : Assets.Icon.calendar)
                                .resizable()
                                .frame(width: viewModel.showCalendar ? 33 : 25)
                                .frame(height: viewModel.showCalendar ? 33 : 25)
                        }.buttonStyle(.plain)
//                            .padding(.horizontal)
                    }
                }
                .monospaced()
        }
        .environmentObject(viewModel)
        .sheet(isPresented: $showingPopover, onDismiss: update) {
            NavigationView {
                addTaskView
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button {
                                showingPopover = false
                            } label: {
                                Text(Constants.Home.cancel)
                                    .foregroundColor(Color(CustomColor.MainColor))
                                    .font(.custom(Font.Regular, size: 16))
                            }
                        })
                    }
            }
        }
    }
}
