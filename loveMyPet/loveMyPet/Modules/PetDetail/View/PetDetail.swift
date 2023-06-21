//
//  PetDetail.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct PetDetailView: View {
    
    @StateObject var petDetailViewModel: PetDetailViewModel
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: petDetailViewModel.pet.image ?? Data()) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 194)
                .clipped()
            
            VStack(alignment: .leading, spacing: 16.0) {
                HStack{
                    Text("Informações")
                        .font(.custom(Font.SemiBold, size: 20))
                    Spacer()
                    Image(petDetailViewModel.pet.gender.rawValue == "Fêmea" ? "IconFemale" : "IconMale")
                }
                
                PetData(title: "Nome", value: petDetailViewModel.pet.name ?? "")
                PetData(title: "Espécie", value: petDetailViewModel.pet.specie.rawValue)
                PetData(title: "Nascimento", value: petDetailViewModel.formattedBirthDate(date: petDetailViewModel.pet.birthDate ?? .now))
                PetData(title: "Raça", value: petDetailViewModel.pet.breed)
                PetData(title: "Raça", value: "\(String(format: "%.1f", petDetailViewModel.pet.weight)) kg")
                
                Divider().frame(height: 4).overlay(Color("Neutral300"))
                
                VStack(alignment: .leading, spacing: 14){
                    Text("Adicionais")
                        .font(.custom(Font.SemiBold, size: 20))
                    
                    PetData(title: "Castrado(a)?", value: petDetailViewModel.pet.isNeutered ? "Sim" : "Não")
                }
            }
            .padding(24.0)
            Spacer()
        }
    }
}

struct PetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailView(petDetailViewModel: .init(pet: Pet()))
    }
}
