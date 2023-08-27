//
//  CustomTextField.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 26/06/2023.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var textFieldLogin: String
    let placecholder: String
    
    var body: some View {
            TextField(placecholder, text: $textFieldLogin)
                .frame(height: 65)
                .padding(.horizontal, 25)
                .background(Color.white.opacity(0.8))
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2),radius: 5)
    }
}
