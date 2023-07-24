//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct LoveMyPetApp: App {
    @AppStorage("showOnBoarding") var showOnBoarding: Bool = true
    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    @State var selectedTab: TabContextView = .pets
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var addViewModel = EditPetViewModel()
    @State private var splashScreenIsActive: Bool = true
    @ObservedObject var taskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            if splashScreenIsActive {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                            self.splashScreenIsActive = false
                        }
                    }
            } else if showOnBoarding {
                NavigationView {
                    OnBoardView()
                }
            } else {
                CustomTabView(selectedTab: $selectedTab) {
                    CustomHomeNavigation { showingPopover in
                        HomeView(homeViewModel: homeViewModel, addSheet: showingPopover)
                    } addView: {
                        EditPetView(addViewModel: addViewModel)
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    } action: {
                        addViewModel.updatePet()
                        Helper.shared.addButtonDisable = true
                    } update: {
                        homeViewModel.fetchAllPets()
                        addViewModel.newPet = NewPet()
                    }
                }
            configView: {
                ConfigView()
            } taskView: {
                CustomTaskNavigation { showingPopover in
                    TaskView(addSheet: showingPopover)
                        .environmentObject(taskViewModel)
                } addTaskView: {
                AddTaskView()
                    .navigationTitle(Constants.Task.addTaskTitle)
                    .navigationBarTitleDisplayMode(.inline)
                } update: {
                taskViewModel.fetchAllTasks()
                }
            }
            .toolbar(selectedTab == .pets ? .visible : .hidden, for: .navigationBar)
            .navigationTitle(selectedTab == .pets ? TabContextView.pets.rawValue : "")
            .navigationBarTitleDisplayMode(selectedTab == .pets ? .inline : .large)
            .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
            }
        }
    }
}
