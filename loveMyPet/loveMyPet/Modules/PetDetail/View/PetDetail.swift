//
//  PetDetail.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct PetDetailView: View {
    @StateObject var petDetailViewModel: PetDetailViewModel
    var pet: Pet
    
    var body: some View {
        VStack{
            Image(pet.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 194)
            
            VStack(alignment: .leading, spacing: 16.0) {
                HStack{
                    Text("Informações")
                        .font(.custom(Font.SemiBold, size: 20))
                    Spacer()
                    Image(pet.gender == "Fêmea" ? "IconFemale" : "IconMale")
                }
                
                PetData(title: "Nome", value: pet.name)
                PetData(title: "Espécie", value: pet.specie)
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
    }
}

struct PetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailView(petDetailViewModel: PetDetailViewModel(), pet: Pet(image:"Cat", name: "Lua", gender: "Fêmea", specie: "Gato", birthDate: Date(), breed: "SRD",  weight: 8.5, isNeutered: true))
    }
}
