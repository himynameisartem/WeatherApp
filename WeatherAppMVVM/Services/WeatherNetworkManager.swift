//
//  WeatherNetworkManager.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import UIKit

class WeatherNetworkManager {
    
    static let shared = WeatherNetworkManager()
    
    func fetchRequest(days: String?, city: String?, completion: @escaping (_ weather: Weather)->()) {
        guard let city = city else { return }
        let urlString = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(city)/next1days?unitGroup=metric&key=YSZEGQDUS95JN9QK35FVTXA32 "
        guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return }
        let url = URL(string: encodedString )
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("error \(error)")
            } else {
                guard let data = data else  { return }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Weather.self, from: data)
                    completion(response)
                } catch {
                    print("error \(error)")
                }
            }
        }
        .resume()
    }
}
