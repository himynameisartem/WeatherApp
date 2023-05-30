//
//  WeatherTodayViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 19.05.2023.
//

import Foundation

class WeatherTodayViewModel: WeatherTodayViewModelProtocol {

    var city: String? 
    var weather: Weather? = nil
    
    func fetchWeather(completion: @escaping () -> Void) {
        WeatherNetworkManager.shared.fetchRequest(days: "7", city: city) { weather in
            self.weather = weather
            completion()
        }
    }
    
    private var indexPath: IndexPath?
    
    private var hours: [Hours]? {
        var currentHours = [Hours]()
        guard let days = weather?.days else { return nil }
        for i in days {
            guard let hours = i.hours else { return nil }
            for j in hours {
                if DateManager.shared.epochToDate(epochTime: j.datetimeEpoch ?? 0.0) {
                    currentHours.append(j)
                }
            }
        }
        return currentHours
    }
    
    func numberOfItems() -> Int? {
        hours?.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> AllHoursCollectionViewCellViewModelProtocol? {
        guard let hours = hours else { return nil }
        let hour = hours[indexPath.row]
        return AllHoursCollectionViewCellViewModel(hours: hour)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func sevenDaysWeather() -> SevenDaysViewModelProtocol? {
        guard let sevenDaysWeather = weather else { return nil }
        return SevenDaysViewModel(weather: sevenDaysWeather)
    }
}
