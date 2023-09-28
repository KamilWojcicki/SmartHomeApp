//
//  SignInGoogleHelper.swift
//  
//
//  Created by Kamil Wójcicki on 28/09/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import DependencyInjection

final class SignInGoogleHelper {
    
    @Inject var Utilities: UtilitiesProtocol
    
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utilities.topViewController(controller: nil) else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
//        let name = gidSignInResult.user.profile?.name
//        let email = gidSignInResult.user.profile?.email
        
        return GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
    }
}
