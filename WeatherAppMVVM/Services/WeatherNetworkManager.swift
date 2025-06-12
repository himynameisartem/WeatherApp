//
//  WeatherNetworkManager.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import UIKit

class WeatherNetworkManager {
    
    static let shared = WeatherNetworkManager()
    
    let apiKey = "234d7d21694748f395d102816251206"
    
    func fetchRequest(city: String?, completion: @escaping (_ weather: Weather)->()) {
        guard let city = city else { return }
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=3"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data else  { return }
            do {
                let response = try JSONDecoder().decode(Weather.self, from: data)
                completion(response)
            } catch {
                print("error \(error)")
            }
        }.resume()
    }
}

