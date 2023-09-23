//
//  SocialMediaButton.swift
//
//
//  Created by Kamil Wójcicki on 20/09/2023.
//

import SwiftUI
import Design


public struct SocialMediaButton: View {
    @Binding private var showSignInView: Bool
    public enum buttonType {
        case apple, google, facebook
    }
    private var type: buttonType
    private var action: () -> Void
    
    private var button: (image: ImageAsset, action: () async throws -> Void) {
        switch type {
        case .apple:            return (Icons.appleLogo,         action)
        case .google:           return (Icons.google,            action)
        case .facebook:         return (Icons.facebook,          action)
        }
    }
    
    public init(showSignInView: Binding<Bool>, type: buttonType, action: @escaping () -> Void) {
        self._showSignInView = showSignInView
        self.type = type
        self.action = action
    }
    
    public var body: some View {
        Button {
            Task {
                do {
                    try await button.action()
                    showSignInView = false
                } catch {
                    print(error)
                }
            }
        } label: {
            Image(asset: button.image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Colors.oxfordBlue, lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.22)
                        .frame(height: 55)
                )
        }
    }
}
#Preview {
    SocialMediaButton(showSignInView: .constant(true), type: .google, action: { })
}
