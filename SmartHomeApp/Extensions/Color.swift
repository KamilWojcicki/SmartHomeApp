//
//  Color.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 26/06/2023.
//

import SwiftUI

extension Color {
    
    init(red: Double, green: Double, blue: Double, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: red/255,
            green: green/255,
            blue: blue/255,
            opacity: opacity
        )
    }
    
//    static var firstBackgroundColor: Color { .init(red: 234, green: 240, blue: 241) }
//    static var secondBackgroundColor: Color { .init(red: 224, green: 226, blue: 230) }
    static var mainColorGray: Color { .init(red: 56, green: 72, blue: 92) }
    static var lightColorGray: Color { .init(red: 184, green: 180, blue: 180) }
    static var mainColorOrange: Color { .init(red: 233, green: 128, blue: 50) }
    static var secondButtonColor: Color { .init(red: 231, green: 101, blue: 45) }
}
