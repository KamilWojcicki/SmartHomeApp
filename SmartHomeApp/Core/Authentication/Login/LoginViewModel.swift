//
//  LoginViewModel.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 10/07/2023.
//

import Foundation
import DependencyInjection

@MainActor
final class LoginViewModel: ObservableObject {
    @Inject var authenticationManager: AuthenticationManagerProtocol
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showSheet: Bool = false
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("NO EMAIL OR PASSWORD FOUND!")
            throw AppError.emptyFields
        }
        try await authenticationManager.signInUser(email: email, password: password)
    }
    
    func resetPassword(email: String) async throws {
        
        guard !email.isEmpty else {
            throw AppError.emptyEmail
        }
        
        let isRegistered = try await authenticationManager.isUserRegistered(email: email)
        
        guard isRegistered else {
            throw AppError.wrongEmail
        }
        
        try await authenticationManager.resetPassword(email: email)
    }
    
}
