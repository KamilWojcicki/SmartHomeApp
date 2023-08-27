//
//  MainButtonViewModifier.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 20/07/2023.
//

import Foundation
import SwiftUI

struct MainButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 65)
            .foregroundColor(.white)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .background(
                RadialGradient(colors: [Color.mainColorOrange, Color.secondButtonColor], center: .center, startRadius: 10, endRadius: 300)
            )
            .cornerRadius(10)
            .padding(.vertical, 30)
            .shadow(color: Color.mainColorOrange.opacity(0.3), radius: 20, y: 20)
    }
}

extension View {
    
    func withMainButtonViewModifier() -> some View {
        modifier(MainButtonViewModifier())
    }
    
}
