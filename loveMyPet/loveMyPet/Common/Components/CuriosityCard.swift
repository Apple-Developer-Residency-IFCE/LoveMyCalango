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
            
            VStack(alignment: .leading) {
                Text(Constants.Task.cardTitle)
                    .foregroundColor(Color(CustomColor.MainColor))
                    .font(.custom(Font.SemiBold, size: 16))
                Text(viewModel.catCuriosity)
                    .multilineTextAlignment(TextAlignment.leading)
            }
            .padding(.vertical, 10)
            Spacer()
            
        }
        .frame(height: 141)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(CustomColor.BorderCardPet), lineWidth: 4)
        )
        .background(Color(CustomColor.BackgroundColor))
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
        catCuriosity = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. S"
    }
}
