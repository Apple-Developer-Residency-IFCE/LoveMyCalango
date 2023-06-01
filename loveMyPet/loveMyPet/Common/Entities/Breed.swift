//
//  Breed.swift
//  loveMyPet
//
//  Created by userext on 30/05/23.
//

import Foundation

let Breed: Dictionary<Specie, [String]> = [
    .none: ["Não Escolhido"],
    .cat: ["Siamês", "Persa", "Bengal", "Maine Coon", "Ragdoll", "SRD"],
    .dog: ["Labrador Retriever", "Bulldog Francês", "Golden Retriever", "Poodle", "Pastor Alemão", "SRD"],
    .bird: ["Canário", "Calopsita", "Periquito", "Papagaio", "Agapornis", "SRD"],
    .rabbit: ["Holland Lop", "Mini Lion", "Angorá", "Fuzzy Lop", "Rex", "SRD"],
    .hamster: ["Sírio", "Russo", "Roborovski", "Chinês", "Anão", "SRD"],
    .turtle: ["Tartaruga-de-orelha-vermelha", "Tartaruga-pintada", "Tartaruga-mordedora-comum", "Tartaruga-mordedora-de-musgo", "Tartaruga-de-esporas", "SRD"],
    .horse: ["Puro Sangue Inglês", "Quarto de Milha", "Andaluz", "Lusitano", "Árabe", "SRD"],
    .custom: [""]
]
