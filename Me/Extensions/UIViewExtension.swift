//
//  UIViewExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/27/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        set { self.layer.cornerRadius = newValue}
        get { return self.layer.cornerRadius }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        set { self.layer.shadowOpacity = newValue}
        get { return self.layer.shadowOpacity }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
                layer.shadowOffset = CGSize(width: 0, height: 5)
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    enum ViewSide {
        case Horizontal, Vertical, Left, Right, Top, Bottom
    }
    
    func addBorder(toSide sides: [ViewSide], withColor color: UIColor, andThickness thickness: CGFloat) {
        
        let firstBorder = CALayer()
        firstBorder.backgroundColor = color.cgColor
        let secondBorder = CALayer()
        secondBorder.backgroundColor = color.cgColor
        
        for side in sides {
            switch side {
            case .Horizontal:
                firstBorder.frame = CGRect(x: 0, y: frame.minY, width: thickness, height: frame.height)
                secondBorder.frame = CGRect(x: frame.width, y: frame.minY, width: thickness, height: frame.height)
            case .Left:
                firstBorder.frame = CGRect(x: 0, y: frame.minY, width: thickness, height: frame.height)
            case .Right:
                secondBorder.frame = CGRect(x: frame.width, y: frame.minY, width: thickness, height: frame.height)
            case .Vertical:
                firstBorder.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
                secondBorder.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: thickness)
            case .Top:
                firstBorder.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            case .Bottom:
                secondBorder.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: thickness)
            }
        }
        
        layer.addSublayer(firstBorder)
        layer.addSublayer(secondBorder)
    }
    
    func addCornerRadius(toSide side: ViewSide, withRadius radius: CGFloat) {
        cornerRadius = radius
        switch side {
        case .Horizontal:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        case .Left:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .Right:
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .Vertical:
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        case .Top:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .Bottom:
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
}
