//
//  HomeView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 08/08/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            VStack(spacing: 30) {
                
                welcomeTextSection
                
                DeviceTile()
                
                Spacer()
            }
            .padding()
        
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    
    private var welcomeTextSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Welcome back Kamil,")
                .font(.system(size: 32))
                
            Text("Remember about your today's tasks")
                .font(.system(size: 20))
                .foregroundColor(Color.mainColorGray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .lineSpacing(7)
        
    }
    
}
