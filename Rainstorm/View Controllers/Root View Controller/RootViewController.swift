//
//  RootViewController.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 8.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {
    
    // MARK: - Types

    private enum AlertType {
        case noWeatherDataAvailable
    }
    
    // MARK: - Properties

    var viewModel: RootViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }

            // Setup View Model
            setupViewModel(with: viewModel)
        }
    }

    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to Instantiate Day View Controller")
        }

        // Configure Day View Controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false

        return dayViewController
    }()
    
    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to Instantiate Day View Controller")
        }

        // Configure Day View Controller
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false

        return weekViewController
    }()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup Child View Controllers
        setupChildViewControllers()
    }
    
    // MARK: - Helper Methods

    private func setupChildViewControllers() {
        // Add Child View Controllers
        addChild(dayViewController)
        addChild(weekViewController)

        // Add Child View as Subview
        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)

        // Configure Day View
        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        // Configure Week View
        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // Notify Child View Controller
        dayViewController.didMove(toParent: self)
        weekViewController.didMove(toParent: self)
    }
    
    private func setupViewModel(with viewModel: RootViewModel) {
        // Configure View Model
        viewModel.didFetchWeatherData = { [weak self] (weatherData, error) in
            if let _ = error {
                // Notify User
                self?.presentAlert(of: .noWeatherDataAvailable)
            } else if let weatherData = weatherData {
                let dayViewModel = DayViewModel(weatherData: weatherData.weatherData)
                self?.dayViewController.viewModel = dayViewModel
            } else {
                // Notify User
                self?.presentAlert(of: .noWeatherDataAvailable)
            }
        }
    }
    
    private func presentAlert(of alertType: AlertType) {
        DispatchQueue.main.async {
            // Helpers
            let title: String
            let message: String

            switch alertType {
            case .noWeatherDataAvailable:
                title = "Unable to Fetch Weather Data"
                message = "The application is unable to fetch weather data. Please make sure your device is connected over Wi-Fi or cellular."
            }

            // Initialize Alert Controller
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            // Add Cancel Action
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            // Present Alert Controller
            self.present(alertController, animated: true)
        }
    }
}

