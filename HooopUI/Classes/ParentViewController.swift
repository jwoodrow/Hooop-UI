//
//  ParentViewController.swift
//  HOOOP
//
//  Created by James Woodrow on 23/01/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import UIKit

public protocol ImplementsSlideInNextView: AnyObject {
    func slideInNextView(_ identifier:String, direction:Direction?, fadeIn:Bool, from:HooopViewController, cover:Bool)
}

public enum Direction{
    case up
    case left
    case right
    case down
}

open class ParentViewController: HooopViewController, ImplementsSlideInNextView {
    open func slideInNextView(_ identifier: String, direction: Direction?, fadeIn: Bool, from: HooopViewController, cover: Bool) {
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) as! HooopViewController
        newViewController.parentController = self
        newViewController.getInit(from)
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(self.currentViewController!, toViewController: newViewController, direction: direction, fadeIn: fadeIn, cover: cover, identifier: identifier)
        self.currentViewController = newViewController
    }
    
    @IBOutlet public var containerView: HooopView!
    public var currentViewController:HooopViewController!
    
    public func addSubview(_ subView:UIView, toView parentView:UIView, direction:Direction?, fadeIn:Bool) {
        if let _ = direction {
            switch direction! {
            case .up:
                subView.frame = CGRect(x: 0, y: parentView.frame.height, width: parentView.frame.width, height: parentView.frame.height)
                break
            case .left:
                subView.frame = CGRect(x: parentView.frame.width, y: 0, width: parentView.frame.width, height: parentView.frame.height)
                break
            case .down:
                subView.frame = CGRect(x: 0, y: -parentView.frame.height, width: parentView.frame.width, height: parentView.frame.height)
                break
            case .right:
                subView.frame = CGRect(x: -parentView.frame.width, y: 0, width: parentView.frame.width, height: parentView.frame.height)
                break
            }
        } else {
            subView.frame = CGRect(origin: .zero, size: parentView.frame.size)
        }
        if (fadeIn) {
            subView.alpha = 0
        }
        parentView.addSubview(subView)
    }
    
    public func cycleFromViewController(_ oldViewController: HooopViewController, toViewController newViewController: HooopViewController, direction:Direction?, fadeIn:Bool, cover:Bool, identifier: String) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(newViewController.view, toView:self.containerView!, direction: direction, fadeIn: fadeIn)
        UIView.animate(withDuration: 0.4, animations: {
            if (fadeIn) {
                oldViewController.view.alpha = 0
                newViewController.view.alpha = 1
            }
            if let _ = direction {
                switch direction! {
                case .up:
                    oldViewController.view.frame = CGRect(x: 0, y: -self.containerView.frame.height, width: self.containerView.frame.width, height: self.containerView.frame.height)
                    break
                case .left:
                    oldViewController.view.frame = CGRect(x: -self.containerView.frame.width, y: 0, width: self.containerView.frame.width, height: self.containerView.frame.height)
                    break
                case .down:
                    oldViewController.view.frame = CGRect(x: 0, y: self.containerView.frame.height, width: self.containerView.frame.width, height: self.containerView.frame.height)
                    break
                case .right:
                    oldViewController.view.frame = CGRect(x: self.containerView.frame.width, y: 0, width: self.containerView.frame.width, height: self.containerView.frame.height)
                    break
                }
                newViewController.view.frame = CGRect(origin: .zero, size: self.containerView.frame.size)
            }
        },
                       completion: { finished in
                        oldViewController.view.removeFromSuperview()
                        oldViewController.removeFromParentViewController()
                        newViewController.didMove(toParentViewController: self)
                        newViewController.appeared()
        })
    }
}
