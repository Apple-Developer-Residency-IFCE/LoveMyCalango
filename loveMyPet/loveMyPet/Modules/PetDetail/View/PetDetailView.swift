//
//  PetDetail.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct PetDetailView: View {
    
    @StateObject var viewModel: PetDetailViewModel
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: viewModel.pet.image ) ?? UIImage(named: Assets.Image.avatarCat2) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 194)
                .clipped()
            
            VStack(alignment: .leading, spacing: 16.0) {
                HStack{
                    Text("Informações")
                        .font(.custom(Font.SemiBold, size: 20))
                    Spacer()
                    Image(viewModel.pet.gender.rawValue == "Fêmea" ? "IconFemale" : "IconMale")
                }
                
                PetData(title: "Nome", value: viewModel.pet.name)
                PetData(title: "Espécie", value: viewModel.pet.specie.rawValue)
                PetData(title: "Nascimento", value: viewModel.formattedBirthDate(date: viewModel.pet.birthDate ))
                PetData(title: "Raça", value: viewModel.pet.breed)
                PetData(title: "Peso", value: viewModel.formattedWeight(weight: viewModel.pet.weight))
                
                Divider().frame(height: 4).overlay(Color("Neutral300"))
                
                VStack(alignment: .leading, spacing: 14){
                    Text("Adicionais")
                        .font(.custom(Font.SemiBold, size: 20))
                    
                    PetData(title: "Castrado(a)?", value: viewModel.pet.isNeutered ? "Sim" : "Não")
                }
            }
            .padding(24.0)
            Spacer()
        }
    }
}
