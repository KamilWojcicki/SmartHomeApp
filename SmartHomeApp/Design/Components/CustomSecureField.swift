//
//  CustomSecureField.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 26/06/2023.
//

import SwiftUI

struct CustomSecureField: View {
    
    @Binding var textFieldPassword: String
    @State private var showPassword: Bool = false
    
    let placecholder: String
    
    var body: some View {
            ZStack {
                TextField(placecholder, text: $textFieldPassword)
                    .opacity(showPassword ? 1 : 0)
                SecureField(placecholder, text: $textFieldPassword)
                    .opacity(showPassword ? 0 : 1)
            }
            
            .frame(height: 65)
            .padding(.horizontal, 25)
            .background(Color.white.opacity(0.8))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2),radius: 5)
                .overlay {
                    Image(systemName:  showPassword ? "eye" : "eye.slash")
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            showPassword.toggle()
                        }
                }
                
    }
}
