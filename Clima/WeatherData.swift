//
//  WeatherData.swift
//  Clima
//
//  Created by 판근 on 2020/07/29.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Weather: Decodable {
    let description: String
}

struct Main: Decodable {
    let temp: Double
}
