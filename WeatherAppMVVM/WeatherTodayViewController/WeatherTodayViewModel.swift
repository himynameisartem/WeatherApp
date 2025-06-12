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
    private var indexPath: IndexPath?
    
    func fetchWeather(completion: @escaping () -> Void) {
        WeatherNetworkManager.shared.fetchRequest(city: city) { weather in
            DispatchQueue.main.async {
                self.weather = weather
                completion()
            }
        }
    }
    
    func numberOfItems() -> Int {
        return weather?.forecast?.forecastday?.first?.hour?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> AllHoursCollectionViewCellViewModelProtocol? {
        guard let hours = self.weather?.forecast?.forecastday?.first?.hour else { return nil }
        let hour = hours[indexPath.row]
        return AllHoursCollectionViewCellViewModel(hour: hour)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func sevenDaysWeather() -> NextDaysViewModelProtocol? {
        guard let weather = weather,
              let day = weather.forecast?.forecastday?.first?.day
        else { return nil }
        
        let nextDaysWeather = NextDaysWeather(city: weather.location?.name ?? "",
                                              temp: String(day.avgtemp_c ?? 0.0),
                                              tempMin: String(day.mintemp_c ?? 0.0),
                                              wind: String(day.maxwind_mph ?? 0.0),
                                              humidity: String(day.avghumidity ?? 0.0),
                                              precipitation: String(day.daily_chance_of_rain ?? 0.0),
                                              weatherDescription: day.condition?.text ?? "",
                                              weatherImage: day.condition?.weatherImageName() ?? "",
                                              nextDaysWeather: weather.forecast?.forecastday)
        return NextDaysViewModel(weather: nextDaysWeather)
    }
}
