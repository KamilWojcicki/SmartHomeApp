//
//  AuthenticationViewModel.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import Foundation
import DependencyInjection

@MainActor
public final class AuthenticationViewModel: ObservableObject {
    @Inject var authenticationManager: AuthenticationManagerProtocol
    @Published var buttonSwitch: Bool = true
    @Published var transition: Bool = false
    @Published var showAlert: Bool = false
    @Published var error: Error?
    
    public func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await authenticationManager.signInWithGoogle(tokens: tokens)
    }
    
    public func signInFacebook() async throws{
        let helper = SignInFacebookHelper()
        let tokens = try await helper.signIn()
        try await authenticationManager.signInWithFacebook(tokens: tokens)
    }
}
