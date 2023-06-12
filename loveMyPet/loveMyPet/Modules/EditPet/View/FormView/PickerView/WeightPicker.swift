//
//  WeightPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct WeightRowFlow: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    @State private var showWeightPicker = false
    
    var body: some View {
        Section {
            VStack {
                HStack {
                    Text("Peso")
                        .foregroundColor(Color("Black-15181D"))
                        .font(.custom(Font.Regular, size: 16))
                    Spacer()
                    Text(viewModel.formattedWeight)
                        .font(.custom(Font.Regular, size: 13))
                        .padding(3)
                        .padding(.horizontal, 4)
                        .background(RoundedRectangle(cornerRadius: 4)
                            .fill(Color("Gray-DBDBDA")))
                }
                .onTapGesture(perform: {
                    if showWeightPicker {
                        showWeightPicker.toggle()
                    } else {
                        withAnimation(.ripple()) {
                            showWeightPicker.toggle()
                        }
                    }
                })
                if showWeightPicker {
                    FormRowCell(type: .weight)
                }
            }
            .listRowBackground(Color("White-F4F3FA"))
        }
    }
}

struct WeightPicker: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
    @Binding var weightKg: Int
    @Binding var weightG: Int
 
    var body: some View {
        HStack(alignment: .center) {
            Picker(selection: $weightKg, label: Text("")) {
                ForEach(0..<4000) { kg in
                    Text("\(kg)").tag(kg)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80)
            
            Text(",")
                .foregroundColor(Color("Black-15181D"))
                .font(.custom(Font.Regular, size: 20))
                .background()
            
            Picker(selection: $weightG, label: Text("")) {
                ForEach(0..<200) { g in
                    Text("\(g % 10)").tag(g % 10)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80)
            
            Text("kg")
                .foregroundColor(Color("Black-15181D"))
                .font(.custom(Font.Regular, size: 20))
        }
        .padding(.leading, 0)
        .onChange(of: weightKg) { _ in
            viewModel.updateFormattedWeight()
        }
        .onChange(of: weightG) { _ in
            viewModel.updateFormattedWeight()
        }
    }
}
