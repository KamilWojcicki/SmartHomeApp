//
//  Root.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 04/07/2023.
//

import SwiftUI


struct Root: View {
    
    @StateObject private var vm = RootViewModel()
    
    var body: some View {
        ZStack {
            if !vm.showSignInView {
               MainView()
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
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
