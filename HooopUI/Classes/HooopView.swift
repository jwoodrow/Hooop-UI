//
//  HooopView.swift
//  HOOOP
//
//  Created by James Woodrow on 05/03/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import UIKit

@IBDesignable public class HooopView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            decorate()
        }
    }
    
     func decorate() {
        self.layer.cornerRadius = cornerRadius
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
