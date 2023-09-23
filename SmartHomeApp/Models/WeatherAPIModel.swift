//
//  WeatherAPIModel.swift
//  SmartHomeApp
//
//  Created by Kamil Wójcicki on 07/08/2023.
//

import Foundation

struct WeatherApiModel: Hashable {
    let temperature: Double
    let time: Date
    let weatherIcon: String
    let date: Date
    
    var fullTemp: String {
        return "\(temperature)°C"
    }
    
    var displayTime: String {
        self.time.formatted(
            .dateTime
                .hour(.defaultDigits(amPM: .abbreviated))
                .minute(.twoDigits)
        )
    }
    
    var displayDate: String {
        self.date.formatted(
            .dateTime
                .day(.twoDigits)
                .month(.twoDigits)
                .year()
        )
    }
}
