//
//  ContentView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 26/06/2023.
//

import SwiftUI
import Design

struct LoginView: View {
    
    @StateObject private var vm = LoginViewModel()
    @EnvironmentObject var rootVM: RootViewModel
    @EnvironmentObject var authVM: AuthenticationViewModel
    @State private var detents: PresentationDetent = .medium
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            
            //Background()
            
            VStack(spacing: 20) {
                
                header
                
                logintextFields
                    
                recoveryButton
                
                signInButton
                
                textWithLines
                    
                socialMediaStack
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(RootViewModel())
    }
}

extension LoginView {
    
    private var header: some View {
        VStack(spacing: 15) {
            Text("Hello Again!")
                .font(.largeTitle)
                .fontWeight(.bold)
                
            Text("Welcome back you've been missed!")
                .font(.title)
                .multilineTextAlignment(.center)
        }
    }
    
    private var logintextFields: some View {
        VStack(spacing: 20) {
            CustomTextField(textFieldLogin: $vm.email, placecholder: "Enter E-mail")
                .textInputAutocapitalization(.none)
            
            CustomSecureField(textFieldPassword: $vm.password, placecholder: "Password")
                .textInputAutocapitalization(.none)
        }
        .padding(.top, 20)
    }
    
    private var recoveryButton: some View {
        
        Button {
            vm.showSheet.toggle()
        } label: {
            Text("Recovery password")
                .font(.footnote)
                .bold()
                .tint(Color.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .sheet(isPresented: $vm.showSheet) {
            PasswordRecoveryView(loginVM: vm)
                .presentationDetents([.medium])
                .alert(Text("Error"), isPresented: $authVM.showAlert, actions: {
                    
                }, message: {
                    Text(authVM.error?.localizedDescription ?? "")
                })
        }

    }
    
    private var signInButton: some View {
        
        Button {
            Task {
                do {
                    try await vm.signIn()
                    rootVM.showSignInView = false
                    print("Login successfully!")
                } catch {
                    self.authVM.error = error
                }
            }
        } label: {
            Text("Sign In!")
                .withMainButtonViewModifier()
        }
        
    }
    
    private var textWithLines: some View {
        HStack {
            CustomLineComponent(startPoint: .leading, endPoint: .trailing)

            Text("Or continue with")
                .font(.footnote)
                .padding(.horizontal)
            
            CustomLineComponent(startPoint: .trailing, endPoint: .leading)
        }
        
    }
    
    private var socialMediaStack: some View {
        HStack {
            SocialMediaLoginView(type: .google)
            SocialMediaLoginView(type: .apple)
            SocialMediaLoginView(type: .facebook)
        }
    }
}
