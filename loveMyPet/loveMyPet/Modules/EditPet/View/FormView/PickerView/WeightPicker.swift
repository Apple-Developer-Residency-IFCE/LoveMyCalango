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
            HStack {
                Button("Peso") {
                    withAnimation(.ripple(index: 1)) {
                        showWeightPicker.toggle()
                    }
                }
                .foregroundColor(Color("Black-15181D"))
                .font(.custom(Constants.Font.Regular, size: 16))
                HStack {
                    Spacer()
                    Text(viewModel.formattedWeight)
                        .font(.custom(Constants.Font.Regular, size: 13))
                        .padding(3)
                        .padding(.horizontal, 4)
                        .background(RoundedRectangle(cornerRadius: 4).fill(Color("Gray-DBDBDA")))
                }
            }
            .listRowBackground(Color("White-F4F3FA"))
            .scaleEffect(showWeightPicker ? 0.9 : 1.0)
            .animation(.spring(), value: showWeightPicker)
            
            if showWeightPicker {
                FormRowCell(type: .weight)
            }
        }
    }
}

struct WeightPicker: View {
    @Binding var weightKg: Int
    @Binding var weightG: Int
    var updateWeight: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Picker(selection: $weightKg, label: Text("")) {
                ForEach(0..<100) { kg in
                    Text("\(kg)").tag(kg)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 60)
            
            Text("kg")
            
            Picker(selection: $weightG, label: Text("")) {
                ForEach(0..<10) { g in
                    Text("\(g * 100)").tag(g * 100)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 60)
            
            Text("g")
        }
        .padding(.leading, 32)
        .onChange(of: weightKg) { _ in
            updateWeight()
        }
        .onChange(of: weightG) { _ in
            updateWeight()
        }
    }
}
