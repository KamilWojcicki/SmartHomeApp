//
//  AppError.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 19/07/2023.
//

import Foundation

enum AppError: Error, LocalizedError {
    case emptyFields
    case emptyEmail
    case wrong
    case wrongEmail
    case wrongFullname
    case passwordNotMatch
    case shortPassword
    case emailInUse
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .emptyFields:
            return "One or more fields are empty!"
        case .emptyEmail:
            return "Email field is empty! Please enter an e-mail."
        case .wrongEmail:
            return "There is a problem with e-mail! Check if you enter a valid e-mail."
        case .wrong:
            return "Wrong e-mail or password! Try again."
        case .wrongFullname:
            return "There is a problem with fullname! Fullname must contains your name and surname separated by a space."
        case .passwordNotMatch:
            return "Passwords do not match! Check if your passwords are the same."
        case .shortPassword:
            return "Password is too short! Passwords needs to be at least 8 characters long."
        case .emailInUse:
            return "Email is already in use! Please enter other valid e-mail."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
