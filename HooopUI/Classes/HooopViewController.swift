//
//  HooopViewController.swift
//  Hooop
//
//  Created by James Woodrow on 05/03/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import UIKit

class HooopViewController: UIViewController {
    var parentController: ParentViewController?
    
    func getInit(_ source:UIViewController){
    }
    func appeared(){
    }
    
    func changeLayout( forTextfield textfield: HooopTextfield, withConfig config: NSDictionary) {
        if (config.value(forKey: "font_name") != nil) {
            textfield.fontName = config.value(forKey: "font_name") as? String
        }
        if (config.value(forKey: "font_size") != nil) {
            textfield.fontSize = CGFloat((config.value(forKey: "font_size") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "letter_spacing") != nil) {
            textfield.letterSpacing = CGFloat((config.value(forKey: "letter_spacing") as! NSNumber).floatValue)
        }
        
        var x: CGFloat!
        var y: CGFloat!
        var width: CGFloat!
        var height: CGFloat!
        if (config.value(forKey: "x") != nil) {
            x = CGFloat((config.value(forKey: "x") as! NSNumber).floatValue)
        } else {
            x = textfield.frame.origin.x
        }
        if (config.value(forKey: "y") != nil) {
            y = CGFloat((config.value(forKey: "y") as! NSNumber).floatValue)
        } else {
            y = textfield.frame.origin.y
        }
        if (config.value(forKey: "width") != nil) {
            width = CGFloat((config.value(forKey: "width") as! NSNumber).floatValue)
        } else {
            width = textfield.frame.size.width
        }
        if (config.value(forKey: "height") != nil) {
            height = CGFloat((config.value(forKey: "height") as! NSNumber).floatValue)
        } else {
            height = textfield.frame.size.height
        }
        
        textfield.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    func changeLayout( forLabel label: HooopLabel, withConfig config: NSDictionary) {
        if (config.value(forKey: "font_name") != nil) {
            label.fontName = config.value(forKey: "font_name") as? String
        }
        if (config.value(forKey: "font_size") != nil) {
            label.fontSize = CGFloat((config.value(forKey: "font_size") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "letter_spacing") != nil) {
            label.letterSpacing = CGFloat((config.value(forKey: "letter_spacing") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "line_spacing") != nil) {
            label.lineHeight = CGFloat((config.value(forKey: "line_spacing") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "baseline_offset") != nil) {
            label.baseLineOffset = CGFloat((config.value(forKey: "baseline_offset") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "lines") != nil) {
            label.numberOfLines = (config.value(forKey: "lines") as! NSNumber).intValue
        }
        
        var x: CGFloat!
        var y: CGFloat!
        var width: CGFloat!
        var height: CGFloat!
        if (config.value(forKey: "x") != nil) {
            x = CGFloat((config.value(forKey: "x") as! NSNumber).floatValue)
        } else {
            x = label.frame.origin.x
        }
        if (config.value(forKey: "y") != nil) {
            y = CGFloat((config.value(forKey: "y") as! NSNumber).floatValue)
        } else {
            y = label.frame.origin.y
        }
        if (config.value(forKey: "width") != nil) {
            width = CGFloat((config.value(forKey: "width") as! NSNumber).floatValue)
        } else {
            width = self.view.bounds.width
        }
        if (config.value(forKey: "height") != nil) {
            height = CGFloat((config.value(forKey: "height") as! NSNumber).floatValue)
        } else {
            height = self.view.bounds.height
        }
        
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        
        var center_x: CGFloat!
        var center_y: CGFloat!
        if (config.value(forKey: "center_x") != nil) {
            center_x = self.view.center.x
        } else {
            center_x = label.center.x
        }
        if (config.value(forKey: "center_y") != nil) {
            center_y = self.view.center.y
        } else {
            center_y = label.center.y
        }
        
        label.center = CGPoint(x: center_x, y: center_y)
    }
    
    func changeLayout( forButton button: HooopButton, withConfig config: NSDictionary) {
        if (config.value(forKey: "font_name") != nil) {
            button.fontName = config.value(forKey: "font_name") as? String
        }
        if (config.value(forKey: "font_size") != nil) {
            button.fontSize = CGFloat((config.value(forKey: "font_size") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "letter_spacing") != nil) {
            button.letterSpacing = CGFloat((config.value(forKey: "letter_spacing") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "line_spacing") != nil) {
            button.lineHeight = CGFloat((config.value(forKey: "line_spacing") as! NSNumber).floatValue)
        }
        if (config.value(forKey: "baseline_offset") != nil) {
            button.baseLineOffset = CGFloat((config.value(forKey: "baseline_offset") as! NSNumber).floatValue)
        }
        
        var x: CGFloat!
        var y: CGFloat!
        var width: CGFloat!
        var height: CGFloat!
        if (config.value(forKey: "x") != nil) {
            x = CGFloat((config.value(forKey: "x") as! NSNumber).floatValue)
        } else {
            x = button.frame.origin.x
        }
        if (config.value(forKey: "y") != nil) {
            y = CGFloat((config.value(forKey: "y") as! NSNumber).floatValue)
        } else {
            y = button.frame.origin.y
        }
        if (config.value(forKey: "width") != nil) {
            width = CGFloat((config.value(forKey: "width") as! NSNumber).floatValue)
        } else {
            width = self.view.bounds.width
        }
        if (config.value(forKey: "height") != nil) {
            height = CGFloat((config.value(forKey: "height") as! NSNumber).floatValue)
        } else {
            height = self.view.bounds.height
        }
        
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        
        var center_x: CGFloat!
        var center_y: CGFloat!
        if (config.value(forKey: "center_x") != nil) {
            center_x = self.view.center.x
        } else {
            center_x = button.center.x
        }
        if (config.value(forKey: "center_y") != nil) {
            center_y = self.view.center.y
        } else {
            center_y = button.center.y
        }
        
        button.center = CGPoint(x: center_x, y: center_y)
    }
    
    func changeLayout( forViews views: [HooopView], withConfig config: NSDictionary) {
        if (config.value(forKey: "corner_radius") != nil) {
            for view in views {
                view.cornerRadius = CGFloat((config.value(forKey: "corner_radius") as! NSNumber).floatValue)
            }
        }
        let base_lead = CGFloat((config.value(forKey: "x") as! NSNumber).floatValue)
        let base_top = CGFloat((config.value(forKey: "y") as! NSNumber).floatValue)
        let spacing = CGFloat((config.value(forKey: "horizontal_spacing") as! NSNumber).floatValue)
        let width = CGFloat((config.value(forKey: "width") as! NSNumber).floatValue)
        let height = CGFloat((config.value(forKey: "height") as! NSNumber).floatValue)
        var counter: CGFloat = 0.0
        for view in views {
            view.cornerRadius = CGFloat((config.value(forKey: "corner_radius") as! NSNumber).floatValue)
            let x = base_lead + (counter * width) + (counter * spacing)
            let y = base_top
            view.frame = CGRect(x: x, y: y, width: width, height: height)
            counter = counter + 1.0
        }
    }
    
    func changeLayout(forView view:HooopView, withConfig config: NSDictionary) {
        if (config.value(forKey: "corner_radius") != nil) {
            view.cornerRadius = CGFloat((config.value(forKey: "corner_radius") as! NSNumber).floatValue)
        }
        var x: CGFloat!
        var y: CGFloat!
        var width: CGFloat!
        var height: CGFloat!
        if (config.value(forKey: "x") != nil) {
            x = CGFloat((config.value(forKey: "x") as! NSNumber).floatValue)
        } else {
            x = view.frame.origin.x
        }
        if (config.value(forKey: "y") != nil) {
            y = CGFloat((config.value(forKey: "y") as! NSNumber).floatValue)
        } else {
            y = view.frame.origin.y
        }
        if (config.value(forKey: "width") != nil) {
            width = CGFloat((config.value(forKey: "width") as! NSNumber).floatValue)
        } else {
            width = view.frame.size.width
        }
        if (config.value(forKey: "height") != nil) {
            height = CGFloat((config.value(forKey: "height") as! NSNumber).floatValue)
        } else {
            height = view.frame.size.height
        }
        
        view.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    func changeLayout(forPad pad:HooopButton, withConfig config: NSDictionary, onColumn column: Int, andLine line: Int) {
        if (config.value(forKey: "font_name") != nil) {
            pad.fontName = config.value(forKey: "font_name") as? String
        }
        if (config.value(forKey: "font_size") != nil) {
            pad.fontSize = CGFloat((config.value(forKey: "font_size") as! NSNumber).floatValue)
        }
        var x: CGFloat!
        var y: CGFloat!
        var width: CGFloat!
        var height: CGFloat!
        if (config.value(forKey: "column_\(column)") != nil) {
            x = CGFloat((config.value(forKey: "column_\(column)") as! NSNumber).floatValue)
        } else {
            x = pad.frame.origin.x
        }
        if (config.value(forKey: "line_\(line)") != nil) {
            y = CGFloat((config.value(forKey: "line_\(line)") as! NSNumber).floatValue)
        } else {
            y = pad.frame.origin.y
        }
        if (config.value(forKey: "width") != nil) {
            width = CGFloat((config.value(forKey: "width") as! NSNumber).floatValue)
            height = CGFloat((config.value(forKey: "width") as! NSNumber).floatValue)
            pad.cornerRadius = width / 2
        } else {
            width = view.frame.size.width
            height = view.frame.size.width
        }
        
        pad.frame = CGRect(x: x, y: y, width: width, height: height)
    }
}

