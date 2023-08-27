//
//  ButtonSwitchView.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 06/07/2023.
//

import SwiftUI



struct ButtonSwitchView: View {

    @EnvironmentObject var authorizationVM: AuthenticationViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button {
                    authorizationVM.buttonSwitch = false
                    authorizationVM.transition = true
                } label: {
                    Text("Register")
                        .foregroundColor(authorizationVM.buttonSwitch ? .black : .white)
                        .font(.headline)
                }
                .frame(width: geometry.size.width / 2)
                Button {
                    authorizationVM.buttonSwitch = true
                    authorizationVM.transition = false
                } label: {
                    Text("Sign In")
                        .foregroundColor(authorizationVM.buttonSwitch ? .white : .black)
                        .font(.headline)
                }
                .frame(width: geometry.size.width / 2)
            }
            .frame(height: 65)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.mainColorGray, lineWidth: 2)
                    .overlay (
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.mainColorGray)
                                .frame(width: geometry.size.width / 2),
                            alignment: authorizationVM.transition ? .leading : .trailing
                    )
                    .animation(.linear(duration: 0.3), value: authorizationVM.transition)
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct ButtonSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            ButtonSwitchView()
                .environmentObject(AuthenticationViewModel())
        }
        
    }
}
