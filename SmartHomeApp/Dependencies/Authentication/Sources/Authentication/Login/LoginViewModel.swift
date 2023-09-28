//
//  LoginViewModel.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import Foundation
import DependencyInjection

@MainActor
public final class LoginViewModel: ObservableObject {
    @Inject var authenticationManager: AuthenticationManagerProtocol
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showSheet: Bool = false
    
    public func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("NO EMAIL OR PASSWORD FOUND!")
            throw AuthErrors.emptyFields
        }
        try await authenticationManager.signInUser(email: email, password: password)
    }
    
    func resetPassword(email: String) async throws {
        
        guard !email.isEmpty else {
            throw AuthErrors.emptyEmail
        }
        
        let isRegistered = try await authenticationManager.isUserRegistered(email: email)
        
        guard isRegistered else {
            throw AuthErrors.wrongEmail
        }
        
        try await authenticationManager.resetPassword(email: email)
    }
    
}
