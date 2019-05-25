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
    @IBInspectable public var checkedImage:UIImage? = nil {
        didSet {
            decorate()
        }
    }
    @IBInspectable public var uncheckedImage:UIImage? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBOutlet public var otherRadios: Array<HooopRadioButton>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(HooopRadioButton.buttonClicked(_:)), for: UIControl.Event.touchUpInside)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(HooopRadioButton.buttonClicked(_:)), for: UIControl.Event.touchUpInside)
    }
    
    // Bool property
    @IBInspectable public var isChecked: Bool = false {
        didSet{
            decorate()
        }
    }
    
    func decorate() {
        if isChecked {
            if (checkedImage != nil) {
                self.setImage(checkedImage, for: UIControl.State.normal)
            }
        } else {
            if (uncheckedImage != nil) {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override public func awakeFromNib() {
        self.addTarget(self, action: #selector(HooopRadioButton.buttonClicked(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
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



