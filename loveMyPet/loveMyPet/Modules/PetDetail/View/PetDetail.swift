//
//  PetDetail.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct PetDetailView: View {
    
    @StateObject private var petDetailViewModel: PetDetailViewModel = .init()
    
    var pet: Pet
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: pet.image) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 194)
                .clipped()
            
            VStack(alignment: .leading, spacing: 16.0) {
                HStack{
                    Text("Informações")
                        .font(.custom(Font.SemiBold, size: 20))
                    Spacer()
                    Image(pet.gender.rawValue == "Fêmea" ? "IconFemale" : "IconMale")
                }
                
                PetData(title: "Nome", value: pet.name)
                PetData(title: "Espécie", value: pet.specie.rawValue)
                PetData(title: "Nascimento", value: petDetailViewModel.formattedBirthDate(date: pet.birthDate))
                PetData(title: "Raça", value: pet.breed)
                PetData(title: "Raça", value: "\(String(format: "%.1f", pet.weight)) kg")
                
                Divider().frame(height: 4).overlay(Color("Neutral300"))
                
                VStack(alignment: .leading, spacing: 14){
                    Text("Adicionais")
                        .font(.custom(Font.SemiBold, size: 20))
                    
                    PetData(title: "Castrado(a)?", value: pet.isNeutered ? "Sim" : "Não")
                }
            }
            .padding(24.0)
            Spacer()
        }
        .background(Color(CustomColor.BackGroundColor))
    }
}

struct PetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailView(pet: Pet())
    }
}
