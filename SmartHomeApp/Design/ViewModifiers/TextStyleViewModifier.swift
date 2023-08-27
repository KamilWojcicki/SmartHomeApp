//
//  TextStyleViewModifier.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 07/08/2023.
//

import Foundation
import SwiftUI

struct TextStyleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.mainColorOrange)
    }
}

extension View {
    func withTextStyleViewModifier() -> some View {
        modifier(TextStyleViewModifier())
    }
}
