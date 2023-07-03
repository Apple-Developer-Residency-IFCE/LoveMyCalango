//
//  CuriosityCard.swift
//  loveMyPet
//
//  Created by Vitor Costa on 30/06/23.
//

import SwiftUI

struct CuriosityCard: View {
    @ObservedObject var viewModel = TaskViewModel()
    
    var body: some View {
        HStack {
            Image(Assets.Image.CuriosityPetFace)
            
            VStack {
                Text(Constants.Task.cardTitle)
                    .foregroundColor(Color(CustomColor.MainColor))
                    .font(.custom(Font.SemiBold, size: 16))
                Text(viewModel.catCuriosity)
            }
            Spacer()
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(CustomColor.BorderCardPet), lineWidth: 4)
        )
        .background(Color(CustomColor.BackGroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 24)
        .onAppear {
            Task {
                do {
                    try await viewModel.getCatCuriosity()
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct CuriosityCard_Previews: PreviewProvider {
    static var previews: some View {
        CuriosityCard()
    }
}

final class TaskViewModel: ObservableObject {
    @Published var catCuriosity: String = ""
    
    public func getCatCuriosity() async throws {
        catCuriosity = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non neque in enim ornare ullamcorper sed vel purus. Pellentesque sollicitudin"
    }
    
}
