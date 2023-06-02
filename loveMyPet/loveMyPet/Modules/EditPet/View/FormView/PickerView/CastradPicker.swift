//
//  CastradPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct CastradPicker: View {
    
    @Binding var castred: Castred
    
    var body: some View {
        Picker("", selection: $castred) {
            ForEach(Castred.allCases) { castred in
                Text(castred.rawValue)
            }
        }
    }
}
