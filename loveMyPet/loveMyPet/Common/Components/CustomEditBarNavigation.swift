//
//  CustomEditBarNavigation.swift
//  loveMyPet
//
//  Created by Ravi on 16/06/23.
//

import SwiftUI

struct CustomEditBarNavigation<Detail: View, Edit: View>: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    @ViewBuilder let detailPet: Detail
    @ViewBuilder let editView: Edit
    @State private var showingPopover = false
    private var selectedPet: Pet
    
    init(selectedPet: Pet, detailView: () -> Detail, editView: () -> Edit) {
        self.detailPet = detailView()
        self.editView = editView()
        self.selectedPet = selectedPet
    }
    
    var body: some View {
        detailPet
            .navigationTitle(Text(Constants.Home.infoPetTitle)
                .foregroundColor(Color(CustomColor.FontColor))
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingPopover = true
                    } label: {
                        Text(Constants.Home.edit)
                            .foregroundColor(Color("MainColor"))
                            .font(.custom(Font.SemiBold, size: 16))
                    }
                }
            }
            .popover(isPresented: $showingPopover) {
                NavigationView {
                    editView
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button {
                                    showingPopover = false
                                } label: {
                                    Text(Constants.Home.cancel)
                                        .foregroundColor(Color("MainColor"))
                                        .font(.custom(Font.Regular, size: 16))
                                }
                            })
                            ToolbarItem(placement: .navigationBarTrailing, content: {
                                Button {
                                    viewModel.updatePet(pet: selectedPet)
                                    showingPopover = false
                                } label: {
                                    Text(Constants.Home.save)
                                        .font(.custom(Font.SemiBold, size: 16))
                                }
                                .disabled(true)
                                .tint(Color("MainColor"))
                            })
                        }
                }
                
            }
    }
}
