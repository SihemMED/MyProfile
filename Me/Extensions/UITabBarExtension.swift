//
//  UITabBarExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/27/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

extension UITabBar {
    func setupTransparentTabBar() {
        backgroundImage = UIImage()
        shadowImage = UIImage()
        backgroundColor = .clear
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().clipsToBounds = true
    }
    
}
