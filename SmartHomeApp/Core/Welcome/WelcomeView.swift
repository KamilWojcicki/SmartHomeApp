//
//  WelcomeView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 07/07/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            
            //Background()
            
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.orange)
                    .frame(height: 350)
                    .padding(.horizontal, 15)
                    .overlay {
                        Image("smart-house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    .padding(.bottom, 60)
                    
                VStack(spacing: 60) {
                    Text("Welcome back \n Kamil")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .bold()
                        .kerning(2)
                        
                    
                    Text("We are happy that you are back! Remember your scheduled tasks in the calendar")
                        .multilineTextAlignment(.center)
                        .font(.callout)
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2)
                        
                }
                .padding(.horizontal, 30)
                 
                Spacer()
            }
        }
    }
    
    func fakeLoadingApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {

        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
