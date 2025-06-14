//
//  NextDaysViewModel:.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import Foundation

class NextDaysViewModel: NextDaysViewModelProtocol {    
    
    private var weather: NextDaysWeather!
    
    var temp: String {
        return "\(weather.temp)°"
    }
    
    var tempMin: String {
        return "/\(weather.tempMin)°"
    }
    
    var wind: String {
        return "\(weather.wind) km/h"
    }
    
    var humidity: String {
        return "\(weather.humidity)%"
    }
    
    var chanceOfRain: String {
        return "\(weather.chanceOfRain)%"
    }
    
    var weatherDescription: String {
        return "\(weather.weatherDescription)"
    }
    
    var weatherImage: String {
        return weather.weatherImage
    }

    var city: String {
        weather.city
    }
    
    var nextDaysWeather: [Forecastday]? {
        return weather.nextDaysWeather
    }
    
    private var indexPath: IndexPath!
    
    func numberOfItems() -> Int? {
        return nextDaysWeather?.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> NextDaysTableViewCellViewModelProtocol? {
        guard let weather = weather.nextDaysWeather else { return nil }
        let day = weather[indexPath.row + 1]
        return NextDaysTableViewCellViewModel(day: day)
    }
    
    init(weather: NextDaysWeather!) {
        self.weather = weather
    }
}
