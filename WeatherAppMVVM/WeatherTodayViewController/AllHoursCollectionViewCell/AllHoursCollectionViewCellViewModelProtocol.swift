//
//  AllHoursCollectionViewCellViewModelProtocol.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 23.05.2023.
//

import Foundation

protocol AllHoursCollectionViewCellViewModelProtocol {
    var temp: String { get }
    var image: String { get }
    var time: String { get }
    init(weather: Weather)
}
