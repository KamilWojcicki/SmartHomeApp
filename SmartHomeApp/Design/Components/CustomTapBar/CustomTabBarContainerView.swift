//
//  CustomTabBarContainerView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 03/08/2023.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    
    let content: Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
        
            CustomTabBarView(tabs: tabs, selection: $selection, localSelecion: selection)

        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
   
    static let tabs: [TabBarItem] = [
        .home, .calendar, .profile
    ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.clear
        }
    }
    
}
