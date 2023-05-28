//
//  FormView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

struct FormView: View {
    
    @State var pet: Pet
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text(pet.name)
                        .foregroundColor(Color("Gray-8C8C8B"))
                        .font(.custom(Constants.Font.Regular, size: 16))
                        .listRowBackground(Color("White-F4F3FA"))
                    FormRowCell(type: .gender, pet: $pet)
                    FormRowCell(type: .specie, pet: $pet)
                    FormRowCell(type: .breed, pet: $pet)
                    FormRowCell(type: .birth, pet: $pet)
                }
                Section {
                    FormRowCell(type: .weight, pet: $pet)
                    FormRowCell(type: .castrated, pet: $pet)
                }
               
            }
            .scrollContentBackground(.hidden)
            
            Button(action: {
                // Ação a ser executada ao pressionar o botão
            }) {
                ZStack {
                    Color("Red-D12929")
                    Text("Excluir Cadastro")
                        .foregroundColor(.white)
                        .font(.custom(Constants.Font.SemiBold, size: 16))
                }
                .frame(height: 50)
                .cornerRadius(10)
                .padding(.horizontal, 24)
            }
            Spacer()
        }
    }
}

struct FormRowCell: View {
    
    private var type: TypeFormRow
    
    @Binding var pet: Pet
    
    @State private var date: Date = .init()
    @State private var gender: String
    @State private var specie: String
    @State private var breed: String
    @State private var customSpecie: String = .init()
    @State private var weight: Double = 0
    @State private var castred: Bool = false
    @State private var showWeightPicker = false
    
    private let kgRange = 0...100
    private let gRange = stride(from: 0, through: 900, by: 100).map { $0 }
    
    var weightPicker: some View {
          VStack {
              Text("Selecione o Peso")
                  .font(.headline)
              
              HStack {
                  Picker("Kg", selection: $weight) {
                      ForEach(kgRange, id: \.self) { kg in
                          Text("\(kg) kg")
                      }
                  }
                  .labelsHidden()
                  .frame(width: 100)
                  
                  Picker("g", selection: $weight) {
                      ForEach(gRange, id: \.self) { g in
                          Text("\(g) g")
                      }
                  }
                  .labelsHidden()
                  .frame(width: 100)
              }
              .padding()
          }
      }
    
    init(type: TypeFormRow, pet: Binding<Pet>) {
        self.type = type
        self._pet = pet
        self._gender = State(initialValue: pet.wrappedValue.gender.rawValue)
        self._specie = State(initialValue: pet.wrappedValue.specie.rawValue)
        self._breed = State(initialValue: pet.wrappedValue.breed)
    }
    
    var body: some View {
        HStack {
            Text(type.title)
                .foregroundColor(Color("Black-15181D"))
                .font(.custom(Constants.Font.Regular, size: 16))
            switch type {
            case .gender:
                Picker("", selection: $gender) {
                    Text(Gender.none.rawValue)
                    Text(Gender.female.rawValue)
                    Text(Gender.male.rawValue)
                }
                .accentColor(Color("Gray-8C8C8B"))
                .font(.custom(Constants.Font.Regular, size: 16))
                .pickerStyle(.menu)
            case .specie:
                Picker("", selection: $specie) {
                    Text(Specie.none.rawValue)
                    Text(Specie.cat.rawValue)
                    Text(Specie.dog.rawValue)
                    Text(Specie.fish.rawValue)
                    Text(Specie.turtle.rawValue)
                    Text(Specie.horse.rawValue)
                    Text(Specie.custom.rawValue)
                }
                .accentColor(Color("Gray-8C8C8B"))
                .font(.custom(Constants.Font.Regular, size: 16))
                .pickerStyle(MenuPickerStyle())
            case .breed:
                Text("")
            case .birth:
                DatePicker("", selection: $date, displayedComponents: .date)
                    .font(.custom(Constants.Font.Regular, size: 16))
                    .accentColor(Color("MainColor"))
            case .weight:
                Button("", action: {
                              showWeightPicker = true
                          })
                .sheet(isPresented: $showWeightPicker) {
                              weightPicker
                          }
            case .castrated:
                Picker("", selection: $castred) {
                    Text("Não")
                    Text("Sim")
                }
            }
        }
        .listRowBackground(Color("White-F4F3FA"))
    }
}

enum TypeFormRow {
    case gender
    case specie
    case breed
    case birth
    case weight
    case castrated
    
    var title: String {
        switch self {
        case .gender:
            return "Gênero"
        case .specie:
            return "Espécie"
        case .breed:
            return "Raça"
        case .birth:
            return "Nascimento"
        case .weight:
            return "Peso"
        case .castrated:
            return "Castrado(a)?"
        }
    }
}

enum Gender {
    case male
    case female
    case none
    
    var rawValue: String {
        switch self {
        case .male:
            return "Macho"
        case .female:
            return "Fêmea"
        case .none:
            return "Nenhum"
        }
    }
}

enum Specie {
    case cat
    case dog
    case fish
    case turtle
    case horse
    case none
    case custom
    
    var rawValue: String {
        switch self {
        case .cat:
            return "Gato"
        case .dog:
            return "Cachorro"
        case .fish:
            return "Peixe"
        case .turtle:
            return "Tartaruga"
        case .horse:
            return "Cavalo"
        case .none:
            return  "Nenhum"
        case .custom:
            return "Custom"
        }
    }
    
    func breeds(for specie: Specie) -> [String] {
            switch specie {
            case .cat:
                return ["Siamês", "Persa", "SRD"]
            case .dog:
                return ["Labrador", "Golden Retriever", "Pastor Alemão", "SRD"]
            case .fish:
                return ["Peixe Dourado", "Betta", "SRD"]
            case .turtle:
                return ["Tartaruga de Ouvido Vermelho", "Tartaruga Pintada", "Tartaruga de Caixa", "SRD"]
            case .horse:
                return ["Puro Sangue Inglês", "Quarto de Milha", "Cavalo Árabe", "SRD"]
            case .none:
                return ["SRD"]
            default:
                return []
            }
        }
}

struct FormView_Previews: PreviewProvider {
        
    static var previews: some View {
        FormView(pet: Pet.mock)
    }
}
