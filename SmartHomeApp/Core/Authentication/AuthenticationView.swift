//
//  AuthorizationView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 08/07/2023.
//

import SwiftUI

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var buttonSwitch: Bool = true
    @Published var transition: Bool = false
    @Published var showAlert: Bool = false
    @Published var error: Error?
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
    
    func signInFacebook() async throws{
        let helper = SignInFacebookHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithFacebook(tokens: tokens)
    }
}

struct AuthenticationView: View {
    
    @StateObject private var vm = AuthenticationViewModel()
    
    var body: some View {
        ZStack {
            
            if vm.buttonSwitch {
                LoginView()
            } else {
                RegisterView()
            }
            
            ButtonSwitchView()
                .padding(30)
            
        }
        .onReceive(vm.$error) { error in
            if error != nil {
                print("Received error: \(error?.localizedDescription ?? "dupa")")
                vm.showAlert.toggle()
            }
        }
        .alert(Text("Error"), isPresented: $vm.showAlert, actions: {
            
        }, message: {
            Text(vm.error?.localizedDescription ?? "")
        })
        .environmentObject(vm)
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView()
        }
    }
}
