//
//  HomeView.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    
    var items: [Item] = [
           Item(id: 1, name: "Item 1"),
           Item(id: 2, name: "Item 2"),
           Item(id: 3, name: "Item 3")
       ]
    
    var body: some View {
        
        NavigationView {
            List(items, id: \.id) { item in
                CustomRowView()
            }
        }
    }
}
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }

struct CustomRowView: View {
    
    var body: some View {
        Text("Pet")
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 4)
            )
    }
}

struct Item: Identifiable {
    var id: Int
    var name: String
}

struct CustomRoWViewMock_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
//            .previewLayout(.sizeThatFits)
    }
}
