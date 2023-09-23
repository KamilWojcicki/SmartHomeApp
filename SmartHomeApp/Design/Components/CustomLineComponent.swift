//
//  CustomLineComponent.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 29/06/2023.
//

import SwiftUI

struct CustomLineComponent: View {
    
    var startPoint: Point
    var endPoint: Point
    
    enum Point {
        case leading
        case trailing
        
        var unitPoint: UnitPoint {
            switch self {
            case .leading:
                return .leading
            case .trailing:
                return .trailing
            }
        }
    }
    
    init(startPoint: Point, endPoint: Point) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.2)
            .mask(
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: startPoint.unitPoint, endPoint: endPoint.unitPoint)
            )
            
    }
}

struct CustomLineComponent_Previews: PreviewProvider {
    static var previews: some View {
        CustomLineComponent(startPoint: .leading, endPoint: .trailing)
    }
}
