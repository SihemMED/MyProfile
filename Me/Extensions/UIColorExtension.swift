//
//  UIColorExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/5/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit
extension UIColor {
    static var random : UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}
