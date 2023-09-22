//
//  AuthorizationView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 08/07/2023.
//

import SwiftUI
import Components
import DependencyInjection

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Inject var authenticationManager: AuthenticationManagerProtocol
    @Published var buttonSwitch: Bool = true
    @Published var transition: Bool = false
    @Published var showAlert: Bool = false
    @Published var error: Error?
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await authenticationManager.signInWithGoogle(tokens: tokens)
    }
    
    func signInFacebook() async throws{
        let helper = SignInFacebookHelper()
        let tokens = try await helper.signIn()
        try await authenticationManager.signInWithFacebook(tokens: tokens)
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
            
            ButtonSwitch(switchButton: $vm.buttonSwitch)
                .padding(30)
            
        }
        .onReceive(vm.$error) { error in
            if error != nil {
                print("Received error: \(error?.localizedDescription ?? "dupa")")
                vm.showAlert.toggle()
            }
            
//            guard let error = error else {
//                print("dupa")
//                return
//            }
//            print("Received error: \(error.localizedDescription)")
//            vm.showAlert.toggle()
        }
        .alert(Text("Error"), isPresented: $vm.showAlert, actions: {
            
        }, message: {
            Text(vm.error?.localizedDescription ?? "seks")
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
