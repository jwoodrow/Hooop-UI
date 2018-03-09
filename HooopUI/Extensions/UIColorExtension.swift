//
//  UIColorExtension.swift
//  HOOOP
//
//  Created by James Woodrow on 24/03/2016.
//  Copyright © 2016 Hooop. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(red: UInt, green: UInt, blue: UInt) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:UInt) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


