//
//  Weather.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import Foundation

class Weather: Decodable {
    let latitude: Double?
    let longitude: Double?
    let resolvedAddress: String?
    let description: String?
    let days: [Days]?
    let currentConditions: CurrentConditions?
}

class Days: WeatherProperties {
    let tempmax: Float?
    let tempmin: Float?
    let precipcover: Float?
    let sunrise: String?
    let sunset: String?
    let description: String?
    let hours: [Hours]?
    
    enum CodingKeys: String, CodingKey {
         case tempmax, tempmin, precipcover, sunrise, sunset,  description, hours
     }

    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tempmax = try container.decodeIfPresent(Float.self, forKey: .tempmax)
        tempmin = try container.decodeIfPresent(Float.self, forKey: .tempmin)
        precipcover = try container.decodeIfPresent(Float.self, forKey: .precipcover)
        sunrise = try container.decodeIfPresent(String.self, forKey: .sunrise)
        sunset = try container.decodeIfPresent(String.self, forKey: .sunset)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        hours = try container.decodeIfPresent([Hours].self, forKey: .hours)

        try super.init(from: decoder)
    }
}

class Hours: WeatherProperties {}

class CurrentConditions: WeatherProperties {
    
    let sunrise: String?
    let sunset: String?

    enum CodingKeys: String, CodingKey {
         case sunrise, sunset
     }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        sunrise = try container.decodeIfPresent(String.self, forKey: .sunrise)
        sunset = try container.decodeIfPresent(String.self, forKey: .sunset)

        try super.init(from: decoder)
    }
}
    
class WeatherProperties: Decodable {
    let datetime: String?
    let datetimeEpoch: Double?
    let temp: Float?
    let feelslike: Float?
    let humidity: Float?
    let dew: Float?
    let precip: Float?
    let precipprob: Float?
    let snow: Float?
    let snowdepth: Float?
    let preciptype: [String]?
    let windgust: Float?
    let windspeed: Float?
    let winddir: Float?
    let pressure: Float?
    let visibility: Float?
    let cloudcover: Float?
    let solarradiation: Float?
    let solarenergy: Float?
    let uvindex: Float?
    let severerisk: Float?
    let conditions: String?
    let icon: String?
}
