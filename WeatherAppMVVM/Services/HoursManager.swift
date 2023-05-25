//
//  HoursManager.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 24.05.2023.
//

import Foundation

class HoursManager {
    static let shared = HoursManager()
    
    func hoursManager(weather: Weather) -> [Hours]? {
        
        var hours = [Hours]()
        
        guard let days = weather.days else { return nil }
        
        for i in days {
            guard let hour = i.hours else { return nil }
            for j in hour {
                hours.append(j)
            }
        }
        return hours
    }
}
