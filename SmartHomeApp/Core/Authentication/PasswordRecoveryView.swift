//
//  PasswordRecoveryView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 12/07/2023.
//

import SwiftUI
import Components

struct PasswordRecoveryView: View {
    
    @ObservedObject var loginVM: LoginViewModel
    @EnvironmentObject var authVM: AuthenticationViewModel
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            
            Text("Enter your e-mail to get a recovery password")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
            
            TextField(textFieldLogin: $email, placecholder: "Enter your email:")
            
            recoveryButton
            
        }
        .padding(30)
    }
}

struct PasswordRecoveryView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecoveryView(loginVM: LoginViewModel())
    }
}

extension PasswordRecoveryView {
    
    private var recoveryButton: some View {
        Button {
            
            Task {
                do {
                    try await loginVM.resetPassword(email: email)
                    print("password reset!")
                    loginVM.showSheet.toggle()
                } catch {
                    self.authVM.error = error
                }
            }
        } label: {
            Text("Recovery now!")
                .withMainButtonViewModifier()
        }
    }
}
