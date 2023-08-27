//
//  SmartHomeAppApp.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 26/06/2023.
//

import SwiftUI
import Firebase

@main
struct SmartHomeAppApp: App {
    
    init() {
        FirebaseApp.configure()
        print("Configured FIREBASE!")
    }
    
    @UIApplicationDelegateAdaptor(AppDelegateFB.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Root()
            //SettingsView()
        }
    }
}
