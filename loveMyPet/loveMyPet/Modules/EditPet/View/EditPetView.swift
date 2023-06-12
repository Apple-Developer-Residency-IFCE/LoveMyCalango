//
//  EditPetView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

struct EditPetView: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    } else {
                        Image("AvatarCat2")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    }
                }
                .onTapGesture {
                    isShowingImagePicker = true
                }
                Text("Trocar foto")
                    .font(.custom(Font.Regular, size: 13))
            }
            .padding(.top, 16)
            FormView()
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}
