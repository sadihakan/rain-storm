//
//  DayViewModel.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 13.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import UIKit

struct DayViewModel {
    
    // MARK: - Properties
    
    let weatherData:  WeatherConditions
    
    private let dateFormatter = DateFormatter()
    
    var date: String {
        dateFormatter.dateFormat = "EEE, MMMM d YYYY"
        
        let unixDate = Date(timeIntervalSince1970: TimeInterval(weatherData.dt))
        return dateFormatter.string(from: unixDate)
    }
    
    var time: String {
        dateFormatter.dateFormat = "hh:mm a"
        
        let unixDate = Date(timeIntervalSince1970: TimeInterval(weatherData.dt))
        return dateFormatter.string(from: unixDate)
    }
    
    var summary: String {
        return weatherData.weather[0].weatherDescription
    }
    
    var temperature: String {
        return String(format: "%.1f °F", weatherData.main.temp)
    }
    
    var windSpeed: String {
        return String(format: "%.f MPH", weatherData.wind.speed)
    }
    
    var image: UIImage? {
        return UIImage.imageForIcon(with: weatherData.weather[0].icon)
    }
    
    
    
}
