//
//  WeatherTodayViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 19.05.2023.
//

import Foundation

class WeatherTodayViewModel: WeatherTodayViewModelProtocol {
    
    var city: String?
    var weather: Weather?
    private var indexPath: IndexPath?

    func fetchWeather(completion: @escaping (Result<Void, Error>) -> Void) {
        NetworkManager.shared.fetchRequest(city: city) { [ weak self ] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.weather = weather
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    var cityName: String {
        return weather?.location?.name ?? ""
    }
    var tempC: String {
        return String(weather?.current?.temp_c ?? 0.0)
    }
    var weatherDescription: String {
        return weather?.current?.condition?.text ?? ""
    }
    var iconName: String {
        weather?.current?.condition?.weatherImageName() ?? ""
    }
    var windSpeed: String {
        return String(weather?.current?.wind_kph ?? 0.0)
    }
    var humidity: String {
        return String(weather?.current?.humidity ?? 0.0)
    }
    var precipitation: String {
        return String(weather?.current?.precip_mm ?? 0.0)
    }
    var currentDate: String {
        return DateManager.shared.todayDate(type: .full)
    }
    
    
    func numberOfItems() -> Int {
        return weather?.forecast?.forecastday?.first?.hour?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> AllHoursCollectionViewCellViewModelProtocol? {
        guard let hours = self.weather?.forecast?.forecastday?.first?.hour else { return nil }
        let hour = hours[indexPath.row]
        return AllHoursCollectionViewCellViewModel(hour: hour)
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
