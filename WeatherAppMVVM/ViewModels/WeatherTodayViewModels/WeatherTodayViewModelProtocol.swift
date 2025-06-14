//
//  WeatherTodayViewModelProtocol.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 19.05.2023.
//

import Foundation

protocol WeatherTodayViewModelProtocol {
    func fetchWeather(completion: @escaping(Result<Void, Error>) -> Void)
    var weather: Weather? { get }
    var city: String? { get set }
    var cityName: String { get }
    var tempC: String { get }
    var weatherDescription: String { get }
    var iconName: String { get }
    var windSpeed: String { get }
    var humidity: String { get }
    var precipitation: String { get }
    var currentDate: String { get }
    func numberOfItems() -> Int
    func cellViewModel(for indexPath: IndexPath) -> AllHoursCollectionViewCellViewModelProtocol?
    func sevenDaysWeather() -> NextDaysViewModelProtocol?
}
