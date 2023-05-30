//
//  SevenDaysViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import Foundation

class SevenDaysViewModel: SevenDaysViewModelProtocol {
    
    private var weather: Weather!
    
    var temp: String {
        guard let temp = weather.days?[1].tempmax else { return ""}
        return "\(temp)°"
    }
    
    var tempMin: String {
        guard let tempMin = weather.days?[1].tempmin else { return "" }
        return "/\(tempMin)°"
    }
    
    var wind: String {
        guard let wind = weather.days?[1].winddir else { return ""}
        return "\(wind) km/h"
    }
    
    var humidity: String {
        guard let humidity = weather.days?[1].humidity else { return ""}
        return "\(humidity)%"
    }
    
    var chanceOfRain: String {
        guard let chanceOfRain = weather.days?[1].precipprob else { return ""}
        return "\(chanceOfRain)%"
    }
    
    var weatherDescription: String {
        guard let description = weather.days?[1].conditions else { return ""}
        return "\(description)"
    }
    
    var weatherImage: String {
        guard let image = weather.days?[1].icon else { return ""}
        return image
    }
    
    var days: [Days]? {
        guard let days = weather.days else { return nil }
        return days
    }
    
    var city: String {
        guard let adress = weather.resolvedAddress else { return "" }
        return adress
    }
    
    required init(weather: Weather) {
        self.weather = weather
    }
    
    
}
