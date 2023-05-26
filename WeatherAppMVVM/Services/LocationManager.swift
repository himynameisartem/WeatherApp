//
//  LocationManager.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import Foundation
import CoreLocation
import UIKit

class LocatioManager {
    
    static let shared = LocatioManager()
    var lon = CLLocationDegrees()
    var lat = CLLocationDegrees()
    
    
    func fetchLocation(lon: CLLocationDegrees, lat: CLLocationDegrees, locationName: UILabel) {

        let location = CLLocation(latitude: lat, longitude: lon)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            let placemark = placemarks?.last
            if placemark != nil {
                guard let city = placemark?.locality else { return }
                guard let country = placemark?.country else { return }
                locationName.text = city + ", " + country
            }
        }
    }
}
