//
//  NextDaysTableViewCellViewModel.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 03.06.2023.
//

import Foundation

class NextDaysTableViewCellViewModel: NextDaysTableViewCellViewModelProtocol {
    
    private var day: Forecastday!
    
    var weekday: String {
        let dateString = day.date ?? ""
        let weekDay = DateManager.shared.getWeekDayFrom(dateString: dateString) ?? ""
        return weekDay
    }
    var imageName: String {
        return day.day?.condition?.weatherImageName() ?? ""
    }
        var desription: String {
        return day.day?.condition?.text ?? ""
    }
    var maxTemp: String {
        return "\(day.day?.avgtemp_c ?? 0.0)°"
    }
    var minTemp: String {
        return "/ \(day.day?.mintemp_c ?? 0.0)°"
    }
    required init(day: Forecastday) {
        self.day = day
    }
}
