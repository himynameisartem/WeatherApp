//
//  DateManager.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 23.05.2023.
//

import Foundation

enum DateType {
    case numerical, full
}

class DateManager {
    
    static let shared = DateManager()
    
    let currentDate = Date()
    var dateFormatter = DateFormatter()
    
    func getWeekDayFrom(dateString: String) -> String? {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        let weekdaySymbol = dateFormatter.shortWeekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
        return weekdaySymbol
    }
    
    func todayDate(type: DateType) -> String {
        if type == .full {
            dateFormatter.dateFormat = "EEEE, dd, MMMM"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
        }
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    
    func timefrom(dateString: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
        return outputFormatter.string(from: date)
    }
}

