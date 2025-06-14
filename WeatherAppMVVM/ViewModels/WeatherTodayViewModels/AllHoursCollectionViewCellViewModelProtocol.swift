//
//  AllHoursCollectionViewCellViewModelProtocol.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 23.05.2023.
//

import Foundation

protocol AllHoursCollectionViewCellViewModelProtocol {
    var hour: Hour { get }
    var temp: String { get }
    var image: String { get }
    var time: String { get }
}
