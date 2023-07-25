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
    static let none = "Nenhum"

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
        static let changePicture = "Trocar foto"
        static let deletePet = "Excluir Cadastro"
        static let save = "Salvar"
        static let edit = "Editar"
        static let infoPetTitle = "Informações do pet"
        static let emptyPetSemibold = "Você não possui nenhum pet cadastrado :("
        static let emptyPetRegular = "Os pets que você criar, aparecerão aqui."

    }
    enum Placeholder {
        static let petName = "Nome do pet"
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
        static let isNeutered = "Castrado(a)?"
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

    enum Task {
        static let cardTitle = "Curiosidade do dia!"
        static let editTaskTitle = "Editar tarefa"
        static let deleteTaskTitle = "Excluir tarefa"
        static let deleteTaskAlert = "Deseja excluir a tarefa?"
        static let emptyTaskSemibold = "Você não possui nenhuma tarefa pendente! :)"
        static let emptyTaskRegular = "As tarefas que você criar, aparecerão aqui."
        static let addTaskTitle = "Adicionar tarefa"
    }

    enum TaskForm {
        static let title = "Título"
        static let type = "Tipo de tarefa"
        static let pet = "Pet"
        static let replay = "Repetir"
        static let remember = "Lembrete"
        static let summary = "Descrição"
    }

    enum OnBoard {
        static let onBoardRightButton = "Avançar"
        static let onBoardLeftButton = "Pular"
        static let onBoardStartButton = "Começar"
        static let onBoardPageOneTitle = "Cadastrar seu pet"
        static let onBoardPageOneDescription = """
        Tenha as informações do seu pet e todo histórico para consultas futuras.
        """
        static let onBoardPageTwoTitle = "Lembrete de vacinas"
        static let onBoardPageTwoDescription = "Agende consultas, vacinas e medicamentos para nunca mais esquecer."
        static let onBoardPageThreeTitle = "Organize rotinas"
        static let onBoardPageThreeDescription = """
        Organize as rotinas dos seus pets.
        Crie tarefas e as visualize em um calendário.
        """
    }
}
