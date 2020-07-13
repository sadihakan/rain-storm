//
//  DayViewController.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 8.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: DayViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            setupViewModel(with: viewModel)
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = UIColor.Rainstorm.base
            dateLabel.font = UIFont.Rainstorm.heavyLarge
        }
    }

    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    
    @IBOutlet var timeLabel: UILabel! 
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var regularLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = UIFont.Rainstorm.lightRegular
            }
        }
    }

    @IBOutlet var smallLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = UIFont.Rainstorm.lightSmall
            }
        }
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
        
    }
    
    // MARK: - Helper Methods
    
    private func setupView() {
        // Configure View
        view.backgroundColor = .green
    }
    
    // MARK: - Helper Methods

    private func setupViewModel(with viewModel: DayViewModel) {
        print(viewModel)
    }
    
}
