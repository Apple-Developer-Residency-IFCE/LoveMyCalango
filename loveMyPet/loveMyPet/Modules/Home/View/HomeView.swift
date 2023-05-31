//
//  HomeView.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView(.vertical) {
            if viewModel.pets.isEmpty {
                VStack {
                    Text("Adicione um pet")
                }
            } else {
                NavigationView {
                    Grid {
                        ForEach(viewModel.pets) { pet in
                            GridRow {
                                NavigationLink(destination: EmptyView()) {
                                    CardPet(item: pet)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct EmptyBgHome: View {
    
    var body: some View {
        VStack {
            Image(systemName: "plus")
                .foregroundColor(Color("Gray-DBDBDA"))
                .frame(width: 42, height: 42)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(style: .init(lineWidth: 3))
                        .foregroundColor(Color("Gray-DBDBDA"))
                })
            Text(Constants.Home.emptyPets)
                .multilineTextAlignment(.center)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBgHome()
    }
}

