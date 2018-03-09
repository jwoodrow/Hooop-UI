//
//  HooopTextfield.swift
//  HOOOP
//
//  Created by James Woodrow on 25/01/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class HooopTextfield: UITextField, UITextFieldDelegate {
    
    @IBInspectable var fontName: String? = "AvenirNext-Bold" {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 15 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.white {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var customTextAlignment: Int = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var letterSpacing: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var customPlaceholder: String? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var horizontalInset: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var verticalInset: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var selfDelegate: Bool = false {
        didSet {
            if selfDelegate {
                self.delegate = self
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var baseLineOffset: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var requiredColor: UIColor? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBOutlet var nextField:HooopTextfield?
    
    /*** more inspectable var can be added **/
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: horizontalInset, dy: verticalInset)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: horizontalInset, dy: verticalInset)
    }
    
    func decorate() {
        // Setup border and corner radius
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        // Setup text style
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        switch customTextAlignment {
        case 2:
            paragraphStyle.alignment = .right
            break
        case 1:
            paragraphStyle.alignment = .center
            break
        default:
            paragraphStyle.alignment = .left
            break
        }
        var titleAttributes:[String : Any] = [
            NSForegroundColorAttributeName: fontColor,
            NSKernAttributeName: letterSpacing,
            NSBaselineOffsetAttributeName: baseLineOffset,
            NSParagraphStyleAttributeName: paragraphStyle
        ]
        if let _ = fontName {
            titleAttributes[NSFontAttributeName] = UIFont(name: fontName!, size: fontSize)
        }
        if let _ = customPlaceholder {
            var placeholderAttributes = titleAttributes
            if let _ = placeholderColor {
                placeholderAttributes[NSForegroundColorAttributeName] = placeholderColor
            }
            let attributedPlaceholder = NSMutableAttributedString(string: customPlaceholder!, attributes: placeholderAttributes)
            if let _ = requiredColor {
                attributedPlaceholder.addAttribute(NSForegroundColorAttributeName, value: requiredColor!.cgColor, range: NSMakeRange(customPlaceholder!.count - 2, 1))
            }
            self.attributedPlaceholder = attributedPlaceholder
        }
        self.defaultTextAttributes = titleAttributes
    }
    
    // MARK: - UITexfieldDelegate
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (nextField != nil) {
            nextField?.becomeFirstResponder()
        }
        return true
    }
}


