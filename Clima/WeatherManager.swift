//
//  WeatherManager.swift
//  Clima
//
//  Created by 판근 on 2020/07/28.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=25d1a374b55cbcd44b9c0a6e22b6060a&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
