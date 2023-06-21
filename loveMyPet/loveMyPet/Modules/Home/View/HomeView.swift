//
//  HomeView.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel: HomeViewModel = .init()
    @StateObject private var editViewModel: EditPetViewModel = .init()
        
    var body: some View {
        ScrollView(.vertical) {
            if viewModel.pets.isEmpty {
                EmptyHome()
            } else {
                Grid {
                    #error("Problema por causa dos bindings")
                    ForEach(viewModel.pets) { pet in
                        VStack {
                            GridRow {
                                NavigationLink(
                                    destination:
                                        CustomEditBarNavigation(selectedPet: pet, customFunc: {
                                            editViewModel.updatePet()
                                        }) {
                                            PetDetailView(petDetailViewModel: PetDetailViewModel(pet: pet))
                                        } editView: {
                                            EditPetView(viewModel: EditPetViewModel(selectedPet: pet))
                                        }
                                ) {
                                    CardPet(item: pet)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 48)
            }
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
