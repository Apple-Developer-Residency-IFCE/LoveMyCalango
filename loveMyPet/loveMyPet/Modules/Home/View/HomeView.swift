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
        
        NavigationView {
            Grid {
                ForEach(viewModel.pets) { pet in
                    GridRow {
                        //                        NavigationLink(destination: EmptyView()) {
                        CardPet(item: pet)
                            .swipeActions(edge: .leading) {
                                Button {  }label: {
                                    
                                    Label("Unread", systemImage:"envelope.badge")
                                }
                            }
                            .swipeActions(edge: .trailing) {
                                Button {  }label: {
                                    Label("Unread", systemImage:"envelope.badge")
                                }
                            }
                        //                        }
                        //                        .foregroundColor(.black)
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

