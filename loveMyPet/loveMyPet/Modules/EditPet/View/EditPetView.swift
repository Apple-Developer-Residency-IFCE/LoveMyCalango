//
//  EditPetView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI
import PhotosUI

struct EditPetView: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @StateObject private var imagePicker = ImagePicker()
    @Binding var pet: Pet
    private var isAddPetFlow: Bool = true
    
    init(pet: Binding<Pet>) {
        self._pet = pet
        self.isAddPetFlow = false
    }
    
    init(){
        self._pet = .constant(Pet())
    }
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $imagePicker.imageSelection) {
                VStack {
                    if let image = imagePicker.image {
                        Image(uiImage: (UIImage(data: image) ?? UIImage()))
                            .resizable()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    } else {
                        Image(Assets.Image.avatarCat2)
                            .resizable()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    }
                    
                    Text(Constants.Home.changePictore)
                        .font(.custom(Font.Regular, size: 13))
                        .foregroundColor(.black)
                }
            }
            .onChange(of: imagePicker.image ?? Data(), perform: { newValue in
                viewModel.changePetImage(data: newValue)
            })
            .padding(.top, 16)
            FormView(isAddPetFlow: isAddPetFlow)
        }
        .onAppear(perform: {
            viewModel.selectedPetToEdit(pet: pet)
        })
    }
}

