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
        fact = """
                A cat's smell is their strongest sense, and they rely on this leading sense to identify
                people and objects; a feline's sense of smell is 14x better than a human
                """
        length = 163
    }
    init(fact: String, length: Int) {
        self.fact = fact
        self.length = length
    }
}
