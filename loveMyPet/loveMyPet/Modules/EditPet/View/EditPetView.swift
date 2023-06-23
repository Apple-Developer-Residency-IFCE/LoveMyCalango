//
//  EditPetView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI
import PhotosUI

struct EditPetView: View {

    @StateObject private var imagePicker = ImagePicker()
    @State private var isShowingImagePicker = false
    @State var isAddPetFlow: Bool = true
    @ObservedObject var viewModel: EditPetViewModel
    
    var updateHome: UpdateHome
    typealias UpdateHome = () -> Void
    
    init(viewModelAddPet: EditPetViewModel, updateHome: @escaping UpdateHome) {
        self.updateHome = updateHome
        self.viewModel = viewModelAddPet
    }
    
    init(viewModel: EditPetViewModel, updateHome: @escaping UpdateHome) {
        self.updateHome = updateHome
        self.isAddPetFlow = false
        self.viewModel = viewModel
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
                        if(isAddPetFlow) {
                            Image(Assets.Image.avatarCat2)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        } else {
                            Image(uiImage: (UIImage(data: viewModel.selectedPet.image ?? Data()) ?? UIImage(systemName: "photo")!))
                                .resizable()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        }
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
            FormView(viewModel: viewModel, isAddPetFlow: isAddPetFlow)
        }.onDisappear {
            Helper.shared.isAddBtnEnable = false
            updateHome()
        }
    }
}

