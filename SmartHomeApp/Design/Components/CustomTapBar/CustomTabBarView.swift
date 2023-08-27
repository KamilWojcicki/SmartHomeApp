//
//  CustomTapBar.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 01/08/2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelecion: TabBarItem
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelecion = newValue
                }
            }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .home, .calendar, .profile
    ]
    
    static var previews: some View {
        CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelecion: tabs.first!)
    }
}

extension CustomTabBarView {
    
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
        .foregroundColor(localSelecion == tab ? Color.orange : Color.white)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelecion == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
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
        .background(Color.mainColorGray .ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}
