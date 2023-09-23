//
//  Provider.swift
//  
//
//  Created by Kamil Wójcicki on 19/09/2023.
//

import Foundation

@propertyWrapper public struct Provider<T> {
    public var wrappedValue: T
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjection.register(dependency: wrappedValue )
    }
}
