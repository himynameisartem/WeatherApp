//
//  WeatherTodayViewModelProtocol.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 19.05.2023.
//

import Foundation

protocol WeatherTodayViewModelProtocol {
    var weather: Weather? { get }
    var city: String? { get set }
    func fetchWeather(completion: @escaping() -> Void)
}
