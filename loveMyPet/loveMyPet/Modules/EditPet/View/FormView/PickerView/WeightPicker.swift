//
//  WeightPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct WeightRowFlow: View {
    
    @StateObject var viewModel: EditPetViewModel
    @State private var showWeightPicker = false
    
    var body: some View {
        Section {
            ZStack {
                if showWeightPicker {
                    FormRowCell(type: .weight, viewModel: viewModel)
                        .padding(.top, 12)
                        .offset(y: 20)
                }
                VStack {
                    HStack {
                        Text(Constants.Picker.weight)
                            .foregroundColor(Color(CustomColor.FontColor))
                            .font(.custom(Font.Regular, size: 16))
                        Spacer()
                        Text(viewModel.formattedWeight)
                            .font(.custom(Font.Regular, size: 13))
                            .padding(3)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 4)
                                .fill(Color(CustomColor.PickerSection)))
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
                    Spacer()
                }
            }
            .listRowBackground(Color(CustomColor.PickerSection))
        }
    }
}

struct WeightPicker: View {
    
    @StateObject var viewModel: EditPetViewModel
 
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Group {
                    Picker(selection: $viewModel.weightKG, label: Text("")) {
                        ForEach(0..<4001) {
                            Text("\($0)")
                                .foregroundColor(Color(CustomColor.FontColor))
                        }
                    }
                    Picker(selection: $viewModel.weightG, label: Text("")) {
                        ForEach(0..<200) {
                            Text("\($0 % 10)")
                                .foregroundColor(Color(CustomColor.FontColor))
                                .tag($0 % 10)
                        }
                    }
                    .overlay {
                        Text("kg")
                            .foregroundColor(Color(CustomColor.FontColor))
                            .font(.custom(Font.Regular, size: 20))
                            .offset(x: 50)
                    }
                }
                .frame(width: geometry.size.width / 2 + 30)
                .labelsHidden()
                .fixedSize(horizontal: true, vertical: true)
                .frame(width: geometry.size.width / 2 , height: 120)
                .clipped()
                .pickerStyle(.wheel)
            }
            .overlay(Text(","))
        }
        .frame(height: 140)
        .mask(Rectangle())
    }
}
