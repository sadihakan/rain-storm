//
//  UIViewController.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 8.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import UIKit

extension UIViewController {
 
    //MARK: - Static Properties
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
