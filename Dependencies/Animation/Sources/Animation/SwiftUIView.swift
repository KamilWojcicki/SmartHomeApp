//
//  SwiftUIView.swift
//  
//
//  Created by Kamil Wójcicki on 12/09/2023.
//

import SwiftUI
import Lottie

struct SwiftUIView: View {
    var body: some View {
        VStack {
            LottieView(animationConfiguration: .loader)
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
