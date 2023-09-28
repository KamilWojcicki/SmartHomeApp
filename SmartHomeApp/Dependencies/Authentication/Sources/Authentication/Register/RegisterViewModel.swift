//
//  RegisterViewModel.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import Foundation
import DependencyInjection

@MainActor
class RegisterViewModel: ObservableObject {
    @Inject var authenticationManager: AuthenticationManagerProtocol
    @Published var email: String = ""
    @Published var fullname: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func signUp() async throws {
        
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, !fullname.isEmpty else {
            print("NO EMAIL OR PASSWORD FOUND!")
            throw AuthErrors.emptyFields
        }
        
        guard password.count > 7 else {
            print("PASSWORD IS TO SHORT")
            throw AuthErrors.shortPassword
        }
        
        guard password == confirmPassword else {
            print("PASSWORDS DO NOT MATCH!")
            throw AuthErrors.passwordNotMatch
        }
        
        do {
            try await authenticationManager.createUser(email: email, password: password)
        } catch {
            throw error
        }
    }
    
}
