//
//  TabBarView.swift
//  
//
//  Created by Kamil Wójcicki on 18/09/2023.
//

import SwiftUI
import Design

public struct TabBarView: View {
    
    private let tabs: [TabBarItem]
    @Binding private var selection: TabBarItem
    @Namespace private var namespace
    @State private var localSelecion: TabBarItem

    public init(tabs: [TabBarItem], selection: Binding<TabBarItem>, localSelecion: TabBarItem) {
        self.tabs = tabs
        self._selection = selection
        self.localSelecion = localSelecion
    }
    
    public var body: some View {
        tabBarVersion2
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelecion = newValue
                }
            }
    }
}

struct TabBarView_Previews: PreviewProvider {

    public static let tabs: [TabBarItem] = [
        .home, .calendar, .profile
    ]

    static var previews: some View {
        TabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelecion: tabs.first!)
    }
}

extension TabBarView {
    
    private func switchToTab(tab: TabBarItem) {
        
            selection = tab
        
    }
    
    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.title2)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelecion == tab ? Colors.jaffa : Colors.white)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelecion == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Colors.white)
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(
            Colors.oxfordBlue
                .ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Colors.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}
