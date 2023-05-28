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
                EmptyHome()
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

struct EmptyHome: View {
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(style: .init(lineWidth: 3))
                .foregroundColor(Color("Gray-DBDBDA"))
                .padding(.horizontal, 24)
                .frame(height: 100)
                .overlay {
                    VStack {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("Gray-DBDBDA"))
                            .frame(width: 42, height: 42)
                            .padding()
                    }
                }
            Text(Constants.Home.emptyPets)
                .foregroundColor(Color("Gray-B3B3B2"))
                .multilineTextAlignment(.center)
                .font(.custom(Constants.Font.Medium, size: 18))
            Spacer()
        }
        .padding(.top, 32)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

