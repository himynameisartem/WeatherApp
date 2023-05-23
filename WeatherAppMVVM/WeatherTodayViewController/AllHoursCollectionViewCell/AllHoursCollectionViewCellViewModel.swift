//
//  AllHoursCollectionViewCellViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 23.05.2023.
//

import Foundation

class AllHoursCollectionViewCellViewModel: AllHoursCollectionViewCellViewModelProtocol {
    private var weather: Weather
    
    var temp: String {
        return weather.days?[0].hours?[10].datetime ?? "sdfr"
    }
    
    var image: String {
        return ""
    }
    
    var time: String {
        return ""
    }
    
    required init(weather: Weather) {
        self.weather = weather
    }
    
    
}
