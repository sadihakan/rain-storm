//
//  Configuration.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 8.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import Foundation
import CoreLocation

enum Defaults {
    
    static let location = CLLocation(latitude: 37.335114, longitude: -122.008928)
    
}

enum WeatherService {
    
    static let apiKey = "7c44d171be87f8b6323ea761835ca264"
    static let baseUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=latitude&lon=longitude&appid=appID")!
    
}
