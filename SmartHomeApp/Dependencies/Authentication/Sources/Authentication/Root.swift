//
//  Root.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import SwiftUI
import DependencyInjection

struct Root: View {
    @Inject var authenticationManager: AuthenticationManagerProtocol
    @StateObject private var vm = RootViewModel()
    
    var body: some View {
        ZStack {
            if !vm.showSignInView {
               MainView()
            }
        }
        .onAppear {
            let authUser = try? authenticationManager.getAuthenticatedUser()
            self.vm.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $vm.showSignInView) {
            AuthenticationView()
        }
        .environmentObject(vm)
    }
}

struct Root_Previews: PreviewProvider {
    static var previews: some View {
        Root()
    }
}

class RootViewModel: ObservableObject {
    @Published var showSignInView: Bool = false
}
