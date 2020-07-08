//
//  WeatherRequest.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 8.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherRequest {
    
    let baseUrl: URL
    
    let location: CLLocation
    
    private var latitude: Double {
        return location.coordinate.latitude
    }
    
    private var longitude: Double {
        return location.coordinate.longitude
    }
    
    let appID: String
    
    var url: URL {
        var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "appid", value: appID)
        ]
        return urlComponents.url!
    }
}



