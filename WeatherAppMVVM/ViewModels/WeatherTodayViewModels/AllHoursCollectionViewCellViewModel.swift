//
//  AllHoursCollectionViewCellViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 23.05.2023.
//

import Foundation

class AllHoursCollectionViewCellViewModel: AllHoursCollectionViewCellViewModelProtocol {
    var hour: Hour
    
    var temp: String {
        return String(hour.temp_c ?? 0.0)
    }
    
    var image: String {
        return hour.condition?.weatherImageName() ?? ""
    }
    
    var time: String {
        return hour.time ?? ""
    }
    
    init(hour: Hour) {
        self.hour = hour
    }
}
