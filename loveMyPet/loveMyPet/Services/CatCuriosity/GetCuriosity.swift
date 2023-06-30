//
//  GetCuriosity.swift
//  loveMyPet
//
//  Created by Vitor Costa on 29/06/23.
//

import Foundation

struct GetCuriosity {
    static func getCuriosity() async throws -> String {
        let curiosity: Fact
        
        do {
            curiosity = try await GetCuriosityHttp().getCuriosityHttp()
            return curiosity.fact
        } catch let error as HttpError {
            switch error {
            case .invalidUrl:
                return Constants.ErrorResponses.invalidUrl
                
            case .invalidResponse:
                return Constants.ErrorResponses.invalidResponse
            
            case .invalidData:
                return Constants.ErrorResponses.invalidData
            }
        }
    }
}
