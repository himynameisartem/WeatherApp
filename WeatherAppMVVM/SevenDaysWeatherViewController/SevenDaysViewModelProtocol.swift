//
//  SevenDaysViewModelProtocol.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import Foundation

protocol SevenDaysViewModelProtocol {
    var days: [Days]? { get }
    var temp: String { get }
    var tempMin: String { get }
    var wind: String { get }
    var humidity: String { get }
    var chanceOfRain: String { get }
    var weatherDescription: String { get }
    var weatherImage: String { get }
    func numberOfItems() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> SevenDaysTableViewCellViewModelProtocol?
    init(weather: Weather)
}
