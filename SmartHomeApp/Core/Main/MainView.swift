//
//  MainView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 08/07/2023.
//

import SwiftUI

@MainActor
final class MainViewModel: ObservableObject {
    
    @Published var authProviders: [AuthProviderOption] = []
    @Published var toggleIsOn: Bool = false
    @Published var selectedOption: String = "English"
    
    func loadAuthProviders() {
        if let provider = try? AuthenticationManager.shared.getProviders() {
            authProviders = provider
        }
            
    }
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updatePassword() async throws {
        let password = "test123!"
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
}

struct MainView: View {
    
    @StateObject private var vm = MainViewModel()
    @EnvironmentObject var rootVM: RootViewModel
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                CustomTabBarContainerView(selection: $tabSelection) {
                    ZStack {
                        TasksView()
                            .tabBarItem(tab: .tasks, selection: $tabSelection)
                        HomeView()
                            .tabBarItem(tab: .home, selection: $tabSelection)
                        DevicesView()
                            .tabBarItem(tab: .devices, selection: $tabSelection)
                    
                    }
                }
                
                if vm.authProviders.contains(.email) {
                    emailSection
                }
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        Task {
                            do {
                                try vm.signOut()
                                rootVM.showSignInView = true
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 30, height: 30)
                            .overlay {
                                Image(systemName: "power")
                                    .imageScale(.medium)
                                    .tint(Color.white)
                            }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView(toogle: $vm.toggleIsOn, selectedOption: $vm.selectedOption)
                    } label: {
                        Image(systemName: "gear")
                            .tint(Color.mainColorGray)
                            .font(.system(size: 23))
                    }
                }
            })
            .onAppear {
                vm.loadAuthProviders()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    private var emailSection: some View {
        VStack {
            
//            Button("Update password") {
//                Task {
//                    do {
//                        try await vm.updatePassword()
//                        print("password updated!!")
//                    } catch {
//                        print(error)
//                    }
//                }
//            }
        }
    }
    
}
