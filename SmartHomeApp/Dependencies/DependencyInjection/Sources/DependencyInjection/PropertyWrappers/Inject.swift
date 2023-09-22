//
//  Inject.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import Foundation

@propertyWrapper public struct Inject<T> {
    public var wrappedValue: T
    
    public init() {
        self.wrappedValue = DependencyInjection.resolve()
    }
}
