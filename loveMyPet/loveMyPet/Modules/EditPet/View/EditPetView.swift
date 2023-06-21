//
//  EditPetView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI
import PhotosUI

struct EditPetView: View {
    
    @State var viewModel: EditPetViewModel
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @StateObject private var imagePicker = ImagePicker()
    private var isAddPetFlow: Bool = true
    @State var newPet: Pet = .init()
    
    init(viewModel: EditPetViewModel) {
        self.isAddPetFlow = false
        self.viewModel = viewModel
    }
    
    init() {
        self.newPet = Pet()
        viewModel = .init()
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
            FormView(isAddPetFlow: isAddPetFlow, viewModel: viewModel)
        }
        .onAppear(perform: {
            if isAddPetFlow {
                viewModel.createNewPet()
            }
        })
    }
}

