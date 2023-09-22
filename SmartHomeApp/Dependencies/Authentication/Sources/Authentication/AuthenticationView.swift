//
//  AuthenticationView.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import SwiftUI
import Components
import DependencyInjection



struct AuthenticationView: View {
    
    @StateObject private var vm = AuthenticationViewModel()
    
    var body: some View {
        ZStack {
            
            if vm.buttonSwitch {
                LoginView()
            } else {
                RegisterView()
            }
            
            ButtonSwitchView(switchButton: $vm.buttonSwitch)
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
