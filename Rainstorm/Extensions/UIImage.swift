//
//  UIImage.swift
//  Rainstorm
//
//  Created by Hakan Koşanoğlu on 13.07.2020.
//  Copyright © 2020 com.kai. All rights reserved.
//

import UIKit

extension UIImage {

    class func imageForIcon(with name: String) -> UIImage? {
        switch name {
        case "01d",
             "03d",
             "09d",
             "10d",
             "11d",
             "13d",
             "50d":
            return UIImage(named: name)
        default:
            return UIImage(named: "01d")
        }
    }

}

