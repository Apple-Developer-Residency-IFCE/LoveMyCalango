//
//  CastradPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct CastradPicker: View {
    
    @Binding private var castred: Castred
    
    init(is castred: Binding<Castred>) {
        self._castred = castred
    }
    
    var body: some View {
        Picker("", selection: $castred) {
            ForEach(Castred.allCases) { castred in
                Text(castred.rawValue)
            }
        }
    }
}

struct CastradPicker_Previews: PreviewProvider {
    static var previews: some View {
        let castred = Binding.constant(Castred.no)
        CastradPicker(is: castred)
    }
}
