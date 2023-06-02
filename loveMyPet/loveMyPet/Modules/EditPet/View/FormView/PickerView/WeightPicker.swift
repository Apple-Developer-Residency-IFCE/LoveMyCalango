//
//  WeightPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct WeightPicker: View {
    
    @Binding private var weightKg: Double
    @Binding private var weightG: Double

    private let kgRange = 0...100
    private let gRange = stride(from: 0, through: 900, by: 100).map { $0 }
    
    var body: some View {
        HStack {
            Picker("", selection: $weightKg) {
                ForEach(kgRange, id: \.self) { kg in
                    Text("\(kg) kg")
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()
            .frame(width: 100)
            
            Picker("", selection: $weightG) {
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
