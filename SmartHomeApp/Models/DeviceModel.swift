//
//  DeviceModel.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 04/08/2023.
//

import Foundation
import SwiftUI

struct DeviceModel: Hashable {
    let iconName: String
    let iconNameisOn: String
    let color: Color
    let colorIsOn: Color
    let addDevice: Bool
    
    
    init(iconName: String = "plus.circle", iconNameIsOn: String = "plus.circle", color: Color = .gray, colorIsOn: Color = .gray, addDevice: Bool = true) {
        self.iconName = iconName
        self.iconNameisOn = iconNameIsOn
        self.color = color
        self.colorIsOn = colorIsOn
        self.addDevice = addDevice
    }
}
