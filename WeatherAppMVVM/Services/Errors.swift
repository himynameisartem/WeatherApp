//
//  Errors.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 14.06.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed
}
