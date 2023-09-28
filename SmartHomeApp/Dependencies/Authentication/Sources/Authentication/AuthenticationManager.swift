//
//  AuthenticationManager.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit

internal enum AuthProviderOption: String {
    case email = "password"
    case google = "google.com"
    case facebook = "facebook.com"
}

internal protocol AuthenticationManagerProtocol {
    func getAuthenticatedUser() throws -> AuthDataResultModel
    func getProviders() throws -> [AuthProviderOption]
    func signOut() throws
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel
    func resetPassword(email: String) async throws
    func updatePassword(password: String) async throws
    func isUserRegistered(email: String) async throws -> Bool
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel
    @discardableResult
    func signInWithFacebook(tokens: FacebookSignInResultModel) async throws -> AuthDataResultModel
}

internal final class AuthenticationManager: AuthenticationManagerProtocol {
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse) //custom error
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func getProviders() throws -> [AuthProviderOption]{
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        
        var providers: [AuthProviderOption] = []
        for provider in providerData {
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
                print(option)
            } else {
                assertionFailure("Provicer option not found: \(provider.providerID)")
            }
        }
        return providers
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
}

// MARK: SIGN IN WITH EMAIL

extension AuthenticationManager {
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    func isUserRegistered(email: String) async throws -> Bool {
        do {
            let user = try await Auth.auth().fetchSignInMethods(forEmail: email)
            
            return !user.isEmpty
        } catch {
            throw error
        }
    }
}

// MARK: SIGN IN WITH GOOGLE

extension AuthenticationManager {
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        try await signIn(credential: GoogleAuthProvider.credential(
            withIDToken: tokens.idToken,
            accessToken: tokens.accessToken)
        )
    }
    
    @discardableResult
    func signInWithFacebook(tokens: FacebookSignInResultModel) async throws -> AuthDataResultModel {
        try await signIn(credential: FacebookAuthProvider.credential(
            withAccessToken: tokens.accessToken)
        )
    }
}

