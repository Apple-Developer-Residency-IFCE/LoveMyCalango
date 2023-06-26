//
//  Fonts.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import Foundation

enum Constants {
    
    static let yes = "Sim"
    static let no = "Não"
    static let female = "Fêmea"
    static let male = "Macho"
    
    enum Style {
        static let system = "Sistema"
        static let light = "Claro"
        static let dark = "Escuro"
    }
    
    enum Home {
        static let title = "Pets"
        static let detail = "Informações do Pet"
        static let emptyPets = "Você não possui nenhum pet\n cadastrado :("
        static let addPetTitle = "Adicionar Pet"
        static let editPetTitle = "Editar Pet"
        static let cancel = "Cancelar"
        static let add = "Adicionar"
        static let changePictore = "Trocar foto"
        static let deletePet = "Excluir Cadastro"
        static let save = "Salvar"
        static let edit = "Editar"
        static let infoPetTitle = "Informações do pet"
        
        enum Placeholder {
            static let petName = "Nome do pet"
        }
    }
    
    enum Picker {
        static let weight = "Peso"
    }
    
    enum Detail {
        static let info = "Informações"
        static let name = "Nome"
        static let specie = "Espécie"
        static let birth = "Nascimento"
        static let breed = "Raça"
        static let addeds = "Adicionais"
        static let castred = "Castrado(a)?"
    }
    
    enum Config {
        static let title = "Configurações"
        static let appereance = "APARÊNCIA"
    }
    
    enum Alert {
        static let deleteRegister = "Deseja excluir o cadastro?"
        static let delete = "Excluir"
        static let description = "Uma vez excluida, essa ação não pode ser desfeita."
    }
}
