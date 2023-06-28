//
//  ImagePicker.swift
//  loveMyPet
//
//  Created by Ravi on 07/06/23.
//

import SwiftUI
import PhotosUI

@MainActor
final class ImagePicker: ObservableObject {
    
    @Published var image: Data?
    
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                self.image = data
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
}
