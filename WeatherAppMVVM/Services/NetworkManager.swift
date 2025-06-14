//
//  WeatherNetworkManager.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let apiKey = "234d7d21694748f395d102816251206"
    
    func fetchRequest(city: String?, completion: @escaping (_ weather: (Result<Weather, Error>))->()) {
        guard let city = city else { return }
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=3"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { completion(.failure(NetworkError.noData))
                return
            }
            do {
                let response = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

