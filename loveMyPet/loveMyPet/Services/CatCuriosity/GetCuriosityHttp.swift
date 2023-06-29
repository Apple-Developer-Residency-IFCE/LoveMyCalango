//
//  GetCuriosityHttp.swift
//  loveMyPet
//
//  Created by Vitor Costa on 28/06/23.
//

import Foundation

struct GetCuriosityHtpp {
    func getCuriosityHttp() async throws -> Fact {
        let urlString = "https://catfact.ninja/fact"
        
        guard let url = URL(string: urlString) else {
            throw HttpError.invalidUrl
        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw HttpError.invalidResponse
        }
        do {
            let data = try JSONDecoder().decode(Fact.self, from: data)
            return data
        } catch {
            throw HttpError.invalidData
        }
    }
}

