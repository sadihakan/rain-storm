//
//  WeatherData.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 13.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import Foundation

protocol WeatherData {
    
    var latitude: Double { get }
    var longitude: Double { get }
    
    var weatherData: WeatherConditions { get }
    
}

protocol WeatherConditions {

    var coord: OpenWeatherAppResponse.Coord { get }
    var weather: [OpenWeatherAppResponse.Weather] { get }
    var main: OpenWeatherAppResponse.Main { get }
    var wind: OpenWeatherAppResponse.Wind { get }
    var timezone: Int { get }
    var name: String { get }
    var dt: Int { get }
    
}




