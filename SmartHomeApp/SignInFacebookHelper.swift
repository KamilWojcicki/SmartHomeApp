//
//  SignInFacebookHelper.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 31/07/2023.
//

import Foundation
import FBSDKLoginKit

final class SignInFacebookHelper {
    @MainActor
    
    func signIn() async throws -> FacebookSignInResultModel {
//        guard let topVC = Utilities.shared.topViewController() else {
//            throw URLError(.cannotFindHost)
//        }

        let manager = LoginManager()
        let loginResult = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<FacebookSignInResultModel, Error>) in
            manager.logIn(permissions: ["public_profile"], from: nil) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = result, !result.isCancelled {
                    guard let accessToken = AccessToken.current?.tokenString else { return }
//                    let name = Profile.current?.name
//                    let email = Profile.current?.email

                    let signInResult = FacebookSignInResultModel(accessToken: accessToken)
                    continuation.resume(returning: signInResult)
                } else {
                    continuation.resume(throwing: NSError(domain: "Facebook", code: 0, userInfo: [NSLocalizedDescriptionKey: "Facebook login was cancelled."]))
                }
            }
        }

        return loginResult
    }
}
