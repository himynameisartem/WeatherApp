//
//  SevenDaysTableViewCellViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 03.06.2023.
//

import Foundation

class SevenDaysTableViewCellViewModel: SevenDaysTableViewCellViewModelProtocol {
    
    private var days: Days!
    
    var weekday: String {
        return DateManager.shared.fetchWeekday(epochTime: days.datetimeEpoch ?? 0.0)
    }
    
    var imageName: String {
        return days.icon ?? ""
    }
    
    var desription: String {
        return days.conditions ?? ""
    }
    
    var maxTemp: String {
        return "\(days.tempmax ?? 0.0)°"
    }
    
    var minTemp: String {
        return "/ \(days.tempmin ?? 0.0)°"
    }
    
    required init(days: Days) {
        self.days = days
    }

}
