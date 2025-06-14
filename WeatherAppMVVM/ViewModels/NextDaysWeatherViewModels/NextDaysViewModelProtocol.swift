//
//  NextDaysViewModelProtocol .swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import Foundation

protocol NextDaysViewModelProtocol {
    var temp: String { get }
    var tempMin: String { get }
    var wind: String { get }
    var humidity: String { get }
    var chanceOfRain: String { get }
    var weatherDescription: String { get }
    var weatherImage: String { get }
    var nextDaysWeather: [Forecastday]? { get }
    func numberOfItems() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> NextDaysTableViewCellViewModelProtocol?
}
