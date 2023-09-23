//
//  CustomRowComponent.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 17/08/2023.
//

import SwiftUI

struct CustomRowComponent: View {
    
    enum Variant {
        case plainText(text: String, action: () -> Void)
        case toggle(text: String, binding: Binding<Bool>)
        case language(text: String, options: [String], selectedOption: Binding<String>)
    }
    
    private let symbol: String
    private let variant: Variant
    
    init(symbol: String, variant: Variant) {
        self.symbol = symbol
        self.variant = variant
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: symbol)
                .foregroundColor(.white)
                .font(.title2)
            
            buildRowView(for: variant)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.mainColorGray)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
    
    @ViewBuilder
    private func buildRowView(for variant: Variant) -> some View {
        switch variant {
        case .plainText(let text, let action):
            buildText(text)
                .onTapGesture(perform: action)
        case .toggle(let text, let binding):
            Toggle(isOn: binding) {
                buildText(text)
            }
            .tint(Color.mainColorOrange)
        case .language(let text, let options, let selectedOption):
            HStack {
                buildText(text)
                Menu {
                    Picker("", selection: selectedOption) {
                        ForEach(options.indices) { index in
                            Text(options[index])
                                .tag(options[index])
                        }
                    }
                } label: {
                    Text(selectedOption.wrappedValue)
                        .foregroundColor(Color.mainColorOrange)
                }
            }
        }
    }
    
    private func buildText(_ text: String) -> some View {
        Text(text)
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CustomRowComponent_Previews: PreviewProvider {
    static var previews: some View {
        
        let options: [String] = [
            "polish", "english"
        ]
        
        VStack(spacing: 15) {
            CustomRowComponent(symbol: "moon.stars", variant: .plainText(text: "test", action: {}))
            
            CustomRowComponent(symbol: "moon.stars", variant: .toggle(text: "test", binding: .constant(true)))
            
            CustomRowComponent(symbol: "moon.stars", variant: .language(text: "test", options: options, selectedOption: .constant(options.first ?? "")))
        }
        
    }
}

