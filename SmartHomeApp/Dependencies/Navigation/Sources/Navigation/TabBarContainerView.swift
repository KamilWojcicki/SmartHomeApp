//
//  TabBarContainerView.swift
//  
//
//  Created by Kamil Wójcicki on 18/09/2023.
//

import SwiftUI

public struct TabBarContainerView<Content:View>: View {
    
    private let content: Content
    @Binding private var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            content
        
            TabBarView(tabs: tabs, selection: $selection, localSelecion: selection)

        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
   
    static let tabs: [TabBarItem] = [
        .home, .calendar, .profile
    ]
    
    static var previews: some View {
        TabBarContainerView(selection: .constant(tabs.first!)) {
            Color.clear
        }
    }
    
}
