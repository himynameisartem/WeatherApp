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
    
    func fetchWeather(completion: @escaping () -> Void) {
        WeatherNetworkManager.shared.fetchRequest(days: "1", city: city) { weather in
            self.weather = weather
            completion()
        }
    }
    
    private var indexPath: IndexPath?
    
    func numberOfItems() -> Int? {
        weather?.days?.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> AllHoursCollectionViewCellViewModelProtocol? {
        <#code#>
    }
    
    func selectedRow(for indexPath: IndexPath) {
        <#code#>
    }
}
