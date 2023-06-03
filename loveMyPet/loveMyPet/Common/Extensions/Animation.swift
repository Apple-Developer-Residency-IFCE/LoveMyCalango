//
//  Animation.swift
//  loveMyPet
//
//  Created by Ravi navarro on 03/06/23.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}
