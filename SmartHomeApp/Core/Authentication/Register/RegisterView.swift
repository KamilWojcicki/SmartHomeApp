//
//  RegisterView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 06/07/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var vm = RegisterViewModel()
    @EnvironmentObject var rootVM: RootViewModel
    
    var body: some View {
        ZStack {
            
            //Background()
            
            VStack(spacing: 20) {
                
                header
                
                registerTextFields
                
                //CustomButton(buttonTitle: "Register now", action:)
                
                Button {
                    Task {
                        do {
                            try await vm.signUp()
                            rootVM.showSignInView = true
                            print("User added successfully!")
                        } catch {
                            print(error)
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
            CustomTextField(textFieldLogin: $vm.email, placecholder: "Enter new E-mail")
            
            CustomTextField(textFieldLogin: $vm.fullname, placecholder: "Enter your full name")
            
            CustomSecureField(textFieldPassword: $vm.password, placecholder: "Enter Password")
            
            CustomSecureField(textFieldPassword: $vm.confirmPassword, placecholder: "Confirm Password")
        }
        .padding(.top, 20)
    }
}

