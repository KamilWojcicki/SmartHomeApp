//
//  SocialMediaLoginView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 01/07/2023.
//

import SwiftUI

struct SocialMediaLoginView: View {
    
    @StateObject private var authVM = AuthenticationViewModel()
    @EnvironmentObject var rootVM: RootViewModel
    enum buttonType {
        case apple, google, facebook
    }
    var type: buttonType
    
    private var button: (image: String, action: () async throws -> Void) {
        switch type {
            case .apple:        return ("apple-logo",        { })
            case .google:       return ("google",            authVM.signInGoogle)
            case .facebook:     return ("facebook",          authVM.signInFacebook)
        }
    }
    
    init(type: buttonType) {
        self.type = type
    }
    
    var body: some View {
        Button {
            Task {
                do {
                    try await button.action()
                    rootVM.showSignInView = false
                } catch {
                    print(error)
                }
            }
        } label: {
            Image(button.image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.mainColorGray, lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.22)
                        .frame(height: 55)
                )
        }
    }
}

struct SocialMediaLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaLoginView(type: .apple)
    }
}
