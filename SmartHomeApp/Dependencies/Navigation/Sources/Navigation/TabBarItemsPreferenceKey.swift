//
//  TabBarItemsPreferenceKey.swift
//  
//
//  Created by Kamil Wójcicki on 18/09/2023.
//

import Foundation
import SwiftUI

public struct TabBarItemsPreferenceKey: PreferenceKey {
    
    public static var defaultValue: [TabBarItem] = []
    public static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
    
}

public struct TabBarItemViewModifier: ViewModifier {
    
    private let tab: TabBarItem
    @Binding private var selection: TabBarItem
    
    public init(tab: TabBarItem, selection: Binding<TabBarItem>) {
        self.tab = tab
        self._selection = selection
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    public func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}
