//
//  HomeView.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            if homeViewModel.pets.isEmpty {
                EmptyHome()
            } else {
                Grid {
                    ForEach(homeViewModel.pets, id: \.id) { pet in
                        VStack {
                            GridRow {
                                NavigationLink {
                                    CustomEditBarNavigation(detailPet: {
                                        PetDetailView(viewModel: PetDetailViewModel(pet: pet))
                                    }, editView: {
                                        EditPetView(viewModel: EditPetViewModel(selectedPet: pet), updateHome: { homeViewModel.fetchAllPets() } )
                                            .navigationTitle(Constants.Home.editPetTitle)
                                            .navigationBarTitleDisplayMode(.inline)
                                    })
                                } label: {
                                    CardPet(item: pet)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 48)
            }
        }.onAppear{
            homeViewModel.fetchAllPets()
        }
    }
}

struct EmptyHome: View {
    
    var body: some View {
        VStack {
            Image(Assets.Image.emptyPet)
                .resizable()
                .padding(.horizontal, 24)
                .padding(.bottom, 18)
            Text(Constants.Home.emptyPets)
                .foregroundColor(Color("Gray-B3B3B2"))
                .multilineTextAlignment(.center)
                .font(.custom(Font.Medium, size: 18))
            Spacer()
        }
        .padding(.top, 32)
    }
}
