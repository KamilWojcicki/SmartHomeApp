//
//  LineComponent.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 04/08/2023.
//

import Foundation
import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
