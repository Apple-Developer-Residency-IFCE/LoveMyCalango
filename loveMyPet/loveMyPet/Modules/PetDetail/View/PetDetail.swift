//
//  PetDetail.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct ContentView: View {
//    struct Pet: Identifiable {
//        let id = UUID()
//        let image: String
//        let name: String
//        let specie: String
//        let birthDate: Date
//        let breed: String
//        let weight: Double
//        let isNeutered: Bool
//    }
//
//    let pet = Pet(image:"Cat", name: "Lua", specie: "Gato", birthDate: Date(), breed: "SRD",  weight: 8.5, isNeutered: true)
    
    var formattedBirthDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "pt_BR")
        return dateFormatter.string(from: pet.birthDate)
    }
    
    var body: some View {
        VStack{
            Image(pet.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 194)
            
            VStack(alignment: .leading, spacing: 16.0) {
                HStack{
                    Text("Informações")
                        .font(.custom(Font.SemiBold), size: 20))
                    Spacer()
                    Image("IconFemale")
                }
                
                HStack {
                    Text("Nome")
                        .font(.custom(Font.SemiBold), size: 16))
                    Spacer()
                    Text(pet.name)
                        .font(.custom(Font.Regular), size: 16))

                }
                
                HStack {
                    Text("Espécie")
                        .font(.custom(Font.SemiBold), size: 16))
                    Spacer()
                    Text(pet.specie)
                        .font(.custom(Font.Regular), size: 16))

                }
                
                HStack {
                    Text("Nascimento")
                        .font(.custom(Font.SemiBold), size: 16))
                    Spacer()
                    Text(formattedBirthDate)
                        .font(.custom(Font.Regular), size: 16))

                }
                
                HStack {
                    Text("Raça")
                        .font(.custom(Font.SemiBold), size: 16))
                    Spacer()
                    Text(pet.breed)
                        .font(.custom(Font.Regular), size: 16))

                }
                
                HStack {
                    Text("Peso")
                        .font(.custom(Font.SemiBold), size: 16))
                    Spacer()
                    Text("\(String(format: "%.1f", pet.weight)) kg")
                        .font(.custom(Font.Regular), size: 16))

                }
                
                Divider().frame(height: 4).overlay(Color("Neutral300"))
                
                VStack(alignment: .leading, spacing: 14){
                    Text("Adicionais")
                        .font(.custom(Font.SemiBold), size: 20))
                    
                    HStack {
                        Text("Castrado(a)?")
                            .font(.custom(Font.SemiBold), size: 16))
                        Spacer()
                        Text(pet.isNeutered ? "Sim" : "Não")
                            .font(.custom(Font.Regular), size: 16))
                    }
                }
                
            }
            .padding(24.0)
            
            Spacer()
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
