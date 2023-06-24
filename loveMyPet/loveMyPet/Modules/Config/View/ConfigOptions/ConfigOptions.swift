//
//  ConfigOptions.swift
//  loveMyPet
//
//  Created by Vitor Costa on 12/06/23.
//

import SwiftUI

struct ConfigOptions: View {
    private var viewModel = ConfigViewModel()
    @State private var selectedButtonIndex: Int?
    
    let configStyle = [
        ("SystemMode", Constants.Style.system),
        ("LightMode", Constants.Style.light),
        ("DarkMode", Constants.Style.dark)
    ]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(configStyle.indices, id: \.self) { index in
                VStack {
                    Image(configStyle[index].0)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 160)
                        .padding(.horizontal)
                    
                    Text(configStyle[index].1)
                        .foregroundColor(Color(CustomColor.FontColor))
                        .font(.custom(Font.Regular, size: 13))
                        .padding(.bottom, 2)
                    
                    ConfigButton(isSelected: Binding(
                        get: { selectedButtonIndex == index },
                        set: { isSelected in
                            selectedButtonIndex = isSelected ? index : nil
                        }
                    ))
                }
                .onTapGesture {
                    selectedButtonIndex = index
                    viewModel.changeScheme(index: index)
                }
            }
        }
        .onAppear {
            selectedButtonIndex = viewModel.preferredColor.rawValue
        }
    }
    
    struct ConfigOptions_Previews: PreviewProvider {
        static var previews: some View {
            ConfigOptions()
        }
    }
}
