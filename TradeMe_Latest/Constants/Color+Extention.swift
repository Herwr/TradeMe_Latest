//
//  File.swift
//  TradeMe_Latest
//
//  Created by Rich on 2/1/22.
//  Copyright © 2022 Funky Gadget Limited. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let tasman500 = Color(hex: 0x148FE2)
    static let feijoa500 = Color(hex: 0x29A754)
    static let bluffOyster800 = Color(hex: 0x393531)
    static let bluffOyster600 = Color(hex: 0x85807B)
}

extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
