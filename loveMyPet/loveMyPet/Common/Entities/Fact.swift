//
//  Fact.swift
//  loveMyPet
//
//  Created by Vitor Costa on 29/06/23.
//

import Foundation

struct Fact: Codable {
    let fact: String
    let length: Int
    
    init() {
        fact = "Gato peludo e gordo é sempre calvo"
        length = 10
    }
    
    init(fact: String, length: Int) {
        self.fact = fact
        self.length = length
    }
    
}
