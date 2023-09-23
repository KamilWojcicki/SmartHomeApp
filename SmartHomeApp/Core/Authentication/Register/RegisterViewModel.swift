//
//  RegisterViewModel.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 10/07/2023.
//

import Foundation

@MainActor
class RegisterViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var fullname: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            print("NO EMAIL OR PASSWORD FOUND!")
            throw URLError(.badURL)
            //return
        }
        
        guard password == confirmPassword else {
            print("PASSWORDS DO NOT MATCH!")
            throw URLError(.badURL)
            //return
        }
            
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
}
