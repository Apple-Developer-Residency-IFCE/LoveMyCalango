//
//  HomeView.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel: HomeViewModel
    
    @Binding var pets: [Pet]
    
    init(pets: Binding<[Pet]>) {
        self._pets = pets
        viewModel = .init()
        viewModel.populatePets(pets)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            if viewModel.pets.isEmpty {
                EmptyHome()
            } else {
                Grid {
                    ForEach($viewModel.pets) { pet in
                        VStack {
                            GridRow {
                                NavigationLink(
                                    destination:
                                        CustomEditBarNavigation(selectedPet: pet) {
                                            PetDetailView(pet: pet)
                                        } editView: {
                                            EditPetView(pet: pet)
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
