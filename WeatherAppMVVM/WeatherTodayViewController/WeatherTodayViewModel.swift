//
//  WeatherTodayViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 19.05.2023.
//

import Foundation

class WeatherTodayViewModel: WeatherTodayViewModelProtocol {
    var city: String? = "Houston"
    
        
    var weather: Weather? = nil
//    var city: String? {
//        return "houston"
//    }
    
    func fetchWeather(completion: @escaping () -> Void) {
        WeatherNetworkManager.shared.fetchRequest(city: city) { weather in
            self.weather = weather
            completion()
        }
    }
    
    
}
