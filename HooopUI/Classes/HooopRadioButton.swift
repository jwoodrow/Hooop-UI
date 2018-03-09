//
//  HooopRadioButton.swift
//  HOOOP
//
//  Created by James Woodrow on 26/01/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class HooopRadioButton: UIButton {
    
    // Images
    @IBInspectable var checkedImage:UIImage? = nil {
        didSet {
            decorate()
        }
    }
    @IBInspectable var uncheckedImage:UIImage? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBOutlet var otherRadios: Array<HooopRadioButton>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(HooopRadioButton.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(HooopRadioButton.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    // Bool property
    @IBInspectable var isChecked: Bool = false {
        didSet{
            decorate()
        }
    }
    
    func decorate() {
        if isChecked {
            if (checkedImage != nil) {
                self.setImage(checkedImage, for: UIControlState.normal)
            }
        } else {
            if (uncheckedImage != nil) {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override public func awakeFromNib() {
        self.addTarget(self, action: #selector(HooopRadioButton.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func buttonClicked(_ sender: UIButton) {
        if sender == self {
            if !isChecked {
                isChecked = true
                if let _ = otherRadios {
                    for radio in otherRadios! {
                        radio.isChecked = false
                    }
                }
            }
        }
    }
}



