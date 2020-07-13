//
//  OpenWeatherAppResponse.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 8.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import Foundation

// MARK: - OpenWeatherAppResponse
struct OpenWeatherAppResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let timezone: Int
    let name: String
    
    // MARK: - Coord
    struct Coord: Codable {
        let lon, lat: Double
    }

    // MARK: - Main
    struct Main: Codable {
        let temp, feelsLike, tempMin, tempMax: Double
        let pressure, humidity: Int

        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
        }
    }

    // MARK: - Weather
    struct Weather: Codable {
        let id: Int
        let main, weatherDescription, icon: String

        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
    }

    // MARK: - Wind
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
}

extension OpenWeatherAppResponse: WeatherData {
    
    var latitude: Double {
        return coord.lat
    }
    
    var longitude: Double {
        return coord.lon
    }
    
    var weatherData: WeatherConditions {
        return self
    }
}

extension OpenWeatherAppResponse: WeatherConditions {
    
}


