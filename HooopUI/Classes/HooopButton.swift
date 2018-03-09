//
//  HooopButton.swift
//  HOOOP
//
//  Created by James Woodrow on 25/01/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class HooopButton: UIButton {
    
    @IBInspectable var text: String? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var underlinedWord: String? = nil {
        didSet {
            decorate()
        }
    }
    
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
    
    @IBInspectable var customTextAlignment: Int = 1 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.white {
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
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var lineHeight: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var incrustedImage: UIImage? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var incrustedPosition: Int = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var incrustedVertical: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var baseLineOffset: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var shadowBlurRadius: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var shadowOffsetX: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var shadowBlurColor: UIColor = UIColor.clear {
        didSet {
            decorate()
        }
    }
    
    /*** more inspectable var can be added **/
    
    func decorate() {
        // Shadow if needed
        var shadow:NSShadow? = nil
        if (shadowBlurColor != UIColor.clear) {
            shadow = NSShadow()
            self.layer.masksToBounds = false
            shadow?.shadowColor = shadowBlurColor
            shadow?.shadowOffset = CGSize(width: shadowOffsetX, height: shadowOffsetY)
            shadow?.shadowBlurRadius = shadowBlurRadius
        }
        // Set Corner radius and border
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        // Only apply attributed text if text is defined
        guard let _ = text else { return }
        // Setup text alignment and line spacing
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
        paragraphStyle.lineSpacing = lineHeight
        // Initialize attributed text attributes with color, style, and baseline offset
        var titleAttributes: [String: Any] = [
            NSForegroundColorAttributeName : fontColor,
            NSParagraphStyleAttributeName : paragraphStyle,
            NSKernAttributeName: letterSpacing,
            NSBaselineOffsetAttributeName: baseLineOffset
        ]
        // If the fontName is nil don't define it (it should never be but you never know
        if let _ = fontName {
            titleAttributes[NSFontAttributeName] = UIFont(name: fontName!, size: fontSize) as Any
        }
        // If the shadow is nil don't define it for the attributed string
        if let _ = shadow {
            titleAttributes[NSShadowAttributeName] = shadow!
        }
        // Setup the attributed string
        let titleString = NSMutableAttributedString(string: text!, attributes: titleAttributes)
        // If there is a word to underline set up its attributes for the string
        if let _ = underlinedWord {
            let tmpString: NSString = NSString(string: text!)
            let range = tmpString.range(of: underlinedWord!)
            titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range)
        }
        // If there is an incrusted image in the string set it up in the right place
        if let _ = incrustedImage {
            let textAttachment = NSTextAttachment()
            textAttachment.image = incrustedImage!
            textAttachment.bounds = CGRect(x: 0.0, y: incrustedVertical, width: textAttachment.image!.size.width, height: textAttachment.image!.size.height)
            let imageString = NSAttributedString(attachment: textAttachment)
            titleString.replaceCharacters(in: NSRange(location: incrustedPosition, length: 1), with: imageString)
        }
        self.setAttributedTitle(titleString, for: .normal)
    }
}



