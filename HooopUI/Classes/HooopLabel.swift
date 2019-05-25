//
//  HooopLabel.swift
//  HOOOP
//
//  Created by James Woodrow on 25/01/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class HooopLabel: UILabel {
    
    @IBInspectable override public var text: String? {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var underlinedWord: String? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var fontName: String? = "AvenirNext-Bold" {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var fontSize: CGFloat = 15 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var customTextAlignment: Int = 1 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var fontColor: UIColor = UIColor.white {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var letterSpacing: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var lineHeight: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var incrustedImage: UIImage? = nil {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var incrustedVertical: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var incrustedReplacementCharacter: String = "~" {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var baseLineOffset: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var shadowBlurRadius: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var shadowOffsetX: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var shadowBlurColor: UIColor = UIColor.clear {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
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
        self.layer.borderColor = fontColor.cgColor
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
        var titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor : fontColor,
            NSAttributedString.Key.paragraphStyle : paragraphStyle,
            NSAttributedString.Key.kern: letterSpacing,
            NSAttributedString.Key.baselineOffset: baseLineOffset
        ]
        // If the fontName is nil don't define it (it should never be but you never know
        if let _ = fontName {
            titleAttributes[NSAttributedString.Key.font] = UIFont(name: fontName!, size: fontSize) as Any
        }
        // If the shadow is nil don't define it for the attributed string
        if let _ = shadow {
            titleAttributes[NSAttributedString.Key.shadow] = shadow!
        }
        // Setup the attributed string
        let titleString = NSMutableAttributedString(string: text!, attributes: titleAttributes)
        // If there is a word to underline set up its attributes for the string
        if (underlinedWord != nil) {
            let tmpString: NSString = NSString(string: text!)
            let range = tmpString.range(of: underlinedWord!)
            titleString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        }
        // If there is an incrusted image in the string set it up in the right place
        if (incrustedImage != nil) {
            let textAttachment = NSTextAttachment()
            textAttachment.image = incrustedImage!
            textAttachment.bounds = CGRect(x: 0.0, y: incrustedVertical, width: textAttachment.image!.size.width, height: textAttachment.image!.size.height)
            let imageString = NSAttributedString(attachment: textAttachment)
            let range = NSString(string: text!).range(of: incrustedReplacementCharacter)
            titleString.replaceCharacters(in: range, with: imageString)
        }
        self.attributedText = titleString
    }
}

