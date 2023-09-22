//
//  RegisterViewModel.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 10/07/2023.
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
            throw AppError.emptyFields
        }
        
        guard password.count > 7 else {
            print("PASSWORD IS TO SHORT")
            throw AppError.shortPassword
        }
        
        guard password == confirmPassword else {
            print("PASSWORDS DO NOT MATCH!")
            throw AppError.passwordNotMatch
        }
        
        do {
            try await authenticationManager.createUser(email: email, password: password)
        } catch {
            throw error
        }
    }
    
}
