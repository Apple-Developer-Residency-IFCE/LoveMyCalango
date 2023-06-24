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
                    Text(Constants.Detail.info)
                        .font(.custom(Font.SemiBold, size: 20))
                    Spacer()
                    Image(viewModel.pet.gender.rawValue == Constants.female ? Assets.Icon.female : Assets.Icon.male)
                }
                
                PetData(title: Constants.Detail.name, value: viewModel.pet.name)
                PetData(title: Constants.Detail.specie, value: viewModel.pet.specie.rawValue)
                PetData(title: Constants.Detail.birth, value: viewModel.formattedBirthDate(date: viewModel.pet.birthDate ))
                PetData(title: Constants.Detail.breed, value: viewModel.pet.breed)
                PetData(title: Constants.Picker.weight, value: viewModel.formattedWeight(weight: viewModel.pet.weight))
                
                Divider().frame(height: 4).overlay(Color(CustomColor.Gray.neutral300))
                
                VStack(alignment: .leading, spacing: 14){
                    Text(Constants.Detail.addeds)
                        .font(.custom(Font.SemiBold, size: 20))
                    
                    PetData(title: Constants.Detail.castred, value: viewModel.pet.isNeutered ? Constants.yes : Constants.no)
                }
            }
            .padding(24.0)
            Spacer()
        }
        .background(Color(CustomColor.BackGroundColor))
    }
}
