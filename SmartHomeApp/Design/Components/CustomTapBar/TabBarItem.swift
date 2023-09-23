//
//  TabBarItem.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 03/08/2023.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, tasks, calendar, profile, settings, devices
    
    var iconName: String {
        switch self {
        case .calendar: return "calendar"
        case .home: return "house"
        case .profile: return "person"
        case .settings: return "slider.horizontal.3"
        case .tasks: return "square.and.pencil"
        case .devices: return "tv"
        }
    }
    
    var title: String {
        switch self {
        case .calendar: return "Calendar"
        case .home: return "Home"
        case .profile: return "Profile"
        case .settings: return "Settings"
        case .tasks: return "Tasks"
        case .devices: return "Devices"
        }
    }
}
