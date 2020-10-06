//
//  UINavigationControllerExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/2/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setTransparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .black
        navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
    }
}
