//
//  FileManager.swift
//  loveMyPet
//
//  Created by Vitor Costa on 05/07/23.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()

    func saveImage(imageName: String, image: Data) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Não foi possível acessar o diretório de documentos.")
        }

        let fileName = imageName
        let fileUrl = documentsDirectory.appendingPathComponent(fileName)
        let imageToSave = UIImage(data: image)

        print(imageToSave?.jpegData(compressionQuality: 1))

        let jpegData = imageToSave?.jpegData(compressionQuality: 0.1)

        print(jpegData?.count)

        if FileManager.default.fileExists(atPath: fileUrl.path) {
            do {
                try FileManager.default.removeItem(atPath: fileUrl.path)
                print("Remove old Image")
            } catch let removeError {
                print("Counldn't remove file at path", removeError)
            }
        }
        
        do {
            try jpegData?.write(to: fileUrl)
            print("Image ID: \(imageName) saved. Data: \(jpegData)")
        } catch let error {
            print("error saving file with error", error)
        }
        
    }
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        print("Load Aqui porras")
        
        if let dirPath = paths.first {
            let imageUrl = URL(filePath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
        }
        return nil
    }
}
