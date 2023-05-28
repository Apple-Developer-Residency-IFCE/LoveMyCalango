//
//  WeightPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct WeightPicker: View {
    @Binding private var weight: Double
    @Binding private var showWeightPicker: Bool

    private let kgRange = 0...100
    private let gRange = stride(from: 0, through: 900, by: 100).map { $0 }

    init(for weight: Binding<Double>, show showWeightPicker: Binding<Bool>) {
        self._weight = weight
        self._showWeightPicker = showWeightPicker
    }
    
    var body: some View {
        HStack {
            
            Picker("Selecione o Peso", selection: $weight) {
                ForEach(kgRange, id: \.self) { kg in
                    Text("\(kg) kg")
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()
            .frame(width: 100)
            
            Picker("", selection: $weight) {
                ForEach(gRange, id: \.self) { g in
                    Text("\(g) g")
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()
            .frame(width: 100)
        }
        .frame(height: 100)
        .padding(.horizontal, 24)
    }
}

struct WeightPicker_Previews: PreviewProvider {
    static var previews: some View {
        WeightPicker(for: .constant(0), show: .constant(true))
    }
}
