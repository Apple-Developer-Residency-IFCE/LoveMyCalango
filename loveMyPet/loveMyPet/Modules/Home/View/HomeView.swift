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
            NavigationView {
                Grid {
                    ForEach(viewModel.pets) { pet in
                        GridRow {
                            NavigationLink(destination: EmptyView()) {
                                CardPet(item: pet)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

