//
//  SevenDaysTableViewCellViewModelProtocol.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 03.06.2023.
//

import Foundation


protocol SevenDaysTableViewCellViewModelProtocol {
    
    var weekday: String { get }
    var imageName: String { get }
    var desription: String { get }
    var maxTemp: String { get }
    var minTemp: String { get }
    init(days: Days)
    
}
