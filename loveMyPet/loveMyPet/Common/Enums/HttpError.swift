//
//  HttpError.swift
//  loveMyPet
//
//  Created by Vitor Costa on 28/06/23.
//

import Foundation

enum HttpError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
