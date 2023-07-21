//
//  HomeView.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel
    @State private var firstLoad: Bool = true
    var body: some View {
            ScrollView(.vertical) {
                if homeViewModel.pets.isEmpty {
                    EmptyListView(type: .pets)
                } else {
                    Grid {
                        ForEach(homeViewModel.pets, id: \.id) { pet in
                            VStack {
                                GridRow {
                                    NavigationLink {
                                        CustomEditNavigation(detailPet: {
                                            PetDetailView(pet: pet)
                                        }, editView: {
                                            EditPetView(editViewModel: EditPetViewModel(pet: pet))
                                                .navigationTitle(Constants.Home.editPetTitle)
                                                .navigationBarTitleDisplayMode(.inline)
                                        }, update: { homeViewModel.fetchAllPets() })
                                    } label: {
                                        CardPet(item: pet)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 48)
                }
            }.onAppear {
                if firstLoad {
                    homeViewModel.fetchAllPets()
                    firstLoad = false
                }
            }
            .background(Color(CustomColor.BackgroundColor))
    }
}
