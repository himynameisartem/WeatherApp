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
    
    func todayDate(type: DateType) -> String {
        if type == .full {
            dateFormatter.dateFormat = "EEEE, dd, MMMM"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
        }
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    
    func epochToDate(epochTime: Double) -> Bool {
        let date = Date(timeIntervalSince1970: epochTime)
        dateFormatter.dateFormat = "HH:mm:ss EEEE,dd,MMMM"
        let hours = dateFormatter.string(from: date)
        let currentDate = dateFormatter.string(from: currentDate)
        
        if dateFormatter.date(from: hours)! > dateFormatter.date(from: currentDate)! {
            return true
        } else {
            return false
        }
    }
}

