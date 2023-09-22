//
//  AuthDataResultModel.swift
//
//
//  Created by Kamil Wójcicki on 20/09/2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel: Identifiable, Codable {
    
    let id: String
    let fullname: String
    let email: String?
    let photoURL: String?
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
    init(user: User) {
        self.id = user.uid
        self.fullname = user.displayName ?? "No One"
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
    
}
