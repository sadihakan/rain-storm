//
//  RootViewModel.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 8.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import Foundation

class RootViewModel {
    
    // MARK: - Types

    enum WeatherDataError: Error {
        case noWeatherDataAvailable
    }
    
    // MARK: - Type Aliases

    typealias DidFetchWeatherDataCompletion = (OpenWeatherAppResponse?, WeatherDataError?) -> Void

    // MARK: - Properties

    var didFetchWeatherData: DidFetchWeatherDataCompletion?

    // MARK: - Initialization

    init() {
        // Fetch Weather Data
        fetchWeatherData()
    }

    // MARK: - Helper Methods

    private func fetchWeatherData() {
        // Initialize Weather Request
        let weatherRequest = WeatherRequest(baseUrl: WeatherService.baseUrl, location: Defaults.location, appID: WeatherService.apiKey)

        // Create Data Task
        URLSession.shared.dataTask(with: weatherRequest.url) { [weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }

            if let error = error {
                print("Unable to Fetch Weather Data \(error)")

                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            } else if let data = data {
                // Initialize JSON Decoder
                let decoder = JSONDecoder()

                do {
                    // Decode JSON Response
                    let darkSkyResponse = try decoder.decode(OpenWeatherAppResponse?.self, from: data)

                    // Invoke Completion Handler
                    self?.didFetchWeatherData?(darkSkyResponse, nil)
                } catch {
                    print("Unable to Decode JSON Response \(error)")

                    // Invoke Completion Handler
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                }
            } else {
                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            }
        }.resume()
    }

}
