//
//  Configuration.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 12/09/2023.
//

import Foundation

public struct Configuration {
    public struct File {
        internal let filename: String
        internal let bundle: Bundle
        
        internal init(
            filename: String,
            bundle: Bundle
        ) {
            self.filename = filename
            self.bundle = bundle
        }
    }
    
    public let lightMode: File
    public let darkMode: File
    
    internal init(
        lightMode: File,
        darkMode: File
    ) {
        self.lightMode = lightMode
        self.darkMode = darkMode
    }
}

extension Configuration {
    public static let loader: Self = .init(
        lightMode: .init(
            filename: "animation1.json",
            bundle: .main
        ),
        darkMode: .init(
            filename: "animation1.json",
            bundle: .main
        )
    )
}
