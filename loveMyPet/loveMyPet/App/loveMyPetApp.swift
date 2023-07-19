//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct LoveMyPetApp: App {

    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    @State var selectedTab: TabContextView = .pets
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var addViewModel = EditPetViewModel()
    @ObservedObject var taskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            CustomTabView(selectedTab: $selectedTab) {
                CustomHomeNavigation {
                    HomeView(homeViewModel: homeViewModel)
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
            CustomTaskNavigation {
                TaskView()
                    .environmentObject(taskViewModel)
            } addTaskView: {
            } update: {

            }
        }
        .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
        }
    }
}
