//
//  RegisterView.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import SwiftUI
import Components

struct RegisterView: View {
    
    @StateObject private var vm = RegisterViewModel()
    @EnvironmentObject var rootVM: RootViewModel
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                
                header
                
                registerTextFields
                
                Button {
                    Task {
                        do {
                            try await vm.signUp()
                            rootVM.showSignInView = true
                            print("User added successfully!")
                        } catch {
                            self.authVM.error = error
                        }
                    }
                } label: {
                    Text("Sign Up!")
                        .withMainButtonViewModifier()
                }

                Spacer()
            }
            .padding(.horizontal, 30)
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    
    private var header: some View {
        VStack(spacing: 15) {
            Text("Not a member?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Register now and HAVE FUN!")
                .font(.title)
                .multilineTextAlignment(.center)
        
            
        }
    }
    
    private var registerTextFields: some View {
        VStack(spacing: 20) {
            TextField(textFieldLogin: $vm.email, placecholder: "Enter new E-mail")
            
            TextField(textFieldLogin: $vm.fullname, placecholder: "Enter your full name")
            
            SecureField(textFieldPassword: $vm.password, placecholder: "Enter Password")
            
            SecureField(textFieldPassword: $vm.confirmPassword, placecholder: "Confirm Password")
        }
        .padding(.top, 20)
    }
}
