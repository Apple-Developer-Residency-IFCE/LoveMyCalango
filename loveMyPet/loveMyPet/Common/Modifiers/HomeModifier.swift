//
//  HomeModifier.swift
//  loveMyPet
//
//  Created by userext on 26/05/23.
//

import SwiftUI

// Use with the .applyCustomHome View modifier
struct CustomHomeNavigation: ViewModifier {
    @State private var showingPopover = false
    
    var showingView: AnyView
    init(showingView: AnyView) {
        self.showingView = showingView
    }
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationTitle("Pets")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Adicionar") {
                            showingPopover = true
                        }
                    }
                }
                .popover(isPresented: $showingPopover) {
                    NavigationView {
                        showingView
                            .navigationTitle("Adicionar Pet")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar{
                                ToolbarItem(placement: .navigationBarLeading, content: {
                                    Button("Cancelar") {
                                        showingPopover = false
                                    }
                                })
                                ToolbarItem(placement: .navigationBarTrailing, content: {
                                    Button("Adicionar") {}
                                    
                                })
                            }
                    }
                }
            
        }
        
    }
}
