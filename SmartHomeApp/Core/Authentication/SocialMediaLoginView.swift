//
//  SocialMediaLoginView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 01/07/2023.
//

import SwiftUI
import Design

struct SocialMediaLoginView: View {
    
    @StateObject private var authVM = AuthenticationViewModel()
    //@EnvironmentObject var rootVM: RootViewModel
    @Binding private var showSignInView: Bool
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
    
    init(showSignInView: Binding<Bool>, type: buttonType) {
        self._showSignInView = showSignInView
        self.type = type
    }
    
    var body: some View {
        Button {
            Task {
                do {
                    try await button.action()
                    showSignInView = false
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
                        .stroke(Colors.oxfordBlue, lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.22)
                        .frame(height: 55)
                )
        }
    }
}

struct SocialMediaLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaLoginView(showSignInView: .constant(true), type: .apple)
    }
}
