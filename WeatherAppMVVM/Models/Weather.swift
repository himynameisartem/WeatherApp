//
//  Weather.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import Foundation

class Weather: Decodable {
    let location: Location?
    let current: CurrentWeather?
    let forecast: Forecast?
}

class Location: Decodable {
    let name: String?
}

class CurrentWeather: Decodable {
    let temp_c: Double?
    let condition: Condition?
    let wind_kph: Double?
    let precip_mm: Double?
    let humidity: Double?
}

class Condition: Decodable {
    let text: String?
    
    func weatherImageName() -> String {
        var value = text?.lowercased() ?? ""
        if value.last == " " {
            value = String(value.dropLast())
        }
        switch value {
        case "sunny", "clear":
            return "clear-day"
        case "partly cloudy":
            return "partly-cloudy-day"
        case "cloudy", "overcast":
            return "cloudy"
        case "patchy rain possible", "patchy rain nearby", "moderate rain", "heavy rain", "tropical storm":
            return "rain"
        case "light rain", "light rain shower", "torrential rain shower", "light drizzle":
            return "showers-day"
        case "patchy snow possible", "light snow", "moderate snow":
            return "snow-showers-day"
        case "heavy snow", "blizzard", "blizzard with thunder", "ice pellets", "hail", "freezing rain", "freezing drizzle", "heavy freezing rain":
            return "snow"
        case "mist", "fog", "freezing fog":
            return "fog"
        case "thundery outbreaks possible":
            return "thunder-showers-day"
        case "moderate or heavy rain with thunder", "patchy light rain with thunder", "moderate or heavy snow with thunder":
            return "thunder-heavy-rain"
        case "dust storm", "sandstorm", "hurricane":
            return "wind"
        default:
            return ""
        }
    }
}

class Forecast: Decodable {
    let forecastday: [Forecastday]?
}

class Forecastday: Decodable {
    let date: String?
    let day: Day?
    let hour: [Hour]?
}

class Day: Decodable {
    let maxtemp_c: Double?
    let mintemp_c: Double?
    let avgtemp_c: Double?
    let maxwind_mph: Double?
    let avghumidity: Double?
    let daily_chance_of_rain: Double?
    let condition: Condition?
}

class Hour: Decodable {
    let time: String?
    let temp_c: Double?
    let condition: Condition?
}
