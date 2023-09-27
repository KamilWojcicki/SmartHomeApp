//
//  TapBarItem.swift
//  
//
//  Created by Kamil Wójcicki on 18/09/2023.
//

import SwiftUI

public enum TabBarItem: Hashable {
    case home, tasks, calendar, profile, settings, devices
    
    public var iconName: String {
        switch self {
        case .calendar: return "calendar"
        case .home: return "house"
        case .profile: return "person"
        case .settings: return "slider.horizontal.3"
        case .tasks: return "square.and.pencil"
        case .devices: return "tv"
        }
    }
    
    public var title: String {
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
