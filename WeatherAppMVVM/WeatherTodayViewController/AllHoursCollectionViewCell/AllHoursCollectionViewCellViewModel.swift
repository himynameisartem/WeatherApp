//
//  AllHoursCollectionViewCellViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 23.05.2023.
//

import Foundation

class AllHoursCollectionViewCellViewModel: AllHoursCollectionViewCellViewModelProtocol {
    private var hours: Hours
    
    var temp: Float {
        return hours.temp ?? 0.0
    }
    
    var image: String {
        return hours.icon ?? ""
    }
    
    var time: String {
        return hours.datetime ?? ""
    }
    
    required init(hours: Hours) {
        self.hours = hours
    }
    
    
}
