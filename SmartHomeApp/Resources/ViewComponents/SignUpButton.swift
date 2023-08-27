//
//  SignUpButton.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 28/06/2023.
//

import SwiftUI

struct SignUpButton: View {
    
    @Binding var textFieldLogin: String
    
    var body: some View {
        HStack {
            TextField("Wprowadź login", text: $textFieldLogin)
                .frame(height: 65)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
        }
        .padding(.top, 40)
    }
}
