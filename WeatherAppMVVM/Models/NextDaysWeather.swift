//
//  NextDaysWeather.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 11.06.2025.
//

import Foundation

class NextDaysWeather {
    var city: String
    var temp: String
    var tempMin: String
    var wind: String
    var humidity: String
    var chanceOfRain: String
    var weatherDescription: String
    var weatherImage: String
    var nextDaysWeather: [Forecastday]?
    
    init(city: String, temp: String, tempMin: String, wind: String, humidity: String, precipitation: String, weatherDescription: String, weatherImage: String, nextDaysWeather: [Forecastday]?) {
        self.city = city
        self.temp = temp
        self.tempMin = tempMin
        self.wind = wind
        self.humidity = humidity
        self.chanceOfRain = precipitation
        self.weatherDescription = weatherDescription
        self.weatherImage = weatherImage
        self.nextDaysWeather = nextDaysWeather
    }
}
