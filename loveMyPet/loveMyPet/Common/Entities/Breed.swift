//
//  Breed.swift
//  loveMyPet
//
//  Created by userext on 29/05/23.
//

import Foundation

var breedDict: [Specie: [String]] = [
    .none = ["Não Escolhido"]
        .cat = [ "Siamês",
                  "Persa",
                  "Maine Coon",
                  "Ragdoll",
                  "Bengal",
                  "Abissínio",
                  "British Shorthair",
                  "Scottish Fold",
                  "Sphinx",
                  "Birmanês",
                  "SRD"]
        .dog = ["Poodle",
                     "Labrador Retriever",
                     "Bulldog Francês",
                     "Golden Retriever",
                     "Yorkshire Terrier",
                     "Beagle",
                     "Boxer",
                     "Rottweiler",
                     "Pastor Alemão",
                     "Chihuahua",
                     "SRD"]
        .bird = [    "Canário",
                        "Calopsita (Caturra)",
                        "Agapornis",
                        "Periquito-australiano",
                        "Papagaio-cinzento",
                        "Papagaio-do-congo",
                        "Arara",
                        "Cacatua",
                        "Periquito-inglês",
                        "Caturrita",
                        "SRD"]
        .rabbit = [    "Mini Lion Head",
                       "Holland Lop",
                       "Fuzzy Lop",
                       "Rex",
                       "Mini Rex",
                       "Angorá",
                       "Flemish Giant",
                       "Netherland Dwarf",
                       "Polish",
                       "Himalaio",
                       "SRD"]
        .hamster = [    "Sírio (Hamster-dourado)",
                        "Anão Russo (Hamster-anão-de-Campbell)",
                        "Roborovski (Hamster-robô)",
                        "Chinês (Hamster-chinês)",
                        "Campbell (Hamster-anão-de-Campbell)",
                        "Winter White (Hamster-anão-russo)",
                        "Panda Bear (Hamster-panda)",
                        "Teddy Bear (Hamster-pelúcia)",
                        "Angorá (Hamster-angorá)",
                        "Dourado Mosaico (Hamster-dourado-mosaico)",
                        "SRD"]
        .turtle = [    "Jabuti",
                          "Tartaruga-da-Terra",
                          "Tartaruga-de-Agua",
                          "Tartaruga-Leopardo",
                          "Tartaruga-Pintada",
                          "Tartaruga-Africana",
                          "Tartaruga-Sulcata",
                          "Tartaruga-Hermann",
                          "Tartaruga-Russa",
                          "Tartaruga-Mapa",
                          "SRD"]
        .horse = [    "Puro-sangue Inglês",
                       "Quarto de Milha",
                       "Pampa",
                       "Appaloosa",
                       "Mangalarga Marchador",
                       "Bretão",
                       "Lusitano",
                       "Andaluz",
                       "Frísio",
                       "Árabe",
                       "SRD"]
        .custom = [""]
]
