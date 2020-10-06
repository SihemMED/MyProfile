//
//  CustomTabBarController.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/28/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        roundedTabBarController()
        // Do any additional setup after loading the view.
    }
    

    private func roundedTabBarController() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 20, y: tabBar.bounds.minY + 5, width: tabBar.bounds.width - 40, height: tabBar.bounds.height + 10), cornerRadius: 20).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
        
        tabBar.layer.insertSublayer(layer, at: 0)
        tabBar.setupTransparentTabBar()
        setupTabBarItems()
    }
    
    private func setupTabBarItems() {
        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -5, right: 0)
            }
        }
        tabBar.tintColor = Style.Colors.mongo
    }

    private func performSpringAnimation(imgView: UIView) {

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {

            imgView.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)

            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { (flag) in
            }
        }) { (flag) in

        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item){
            if let subView = tabBar.subviews[index+1].subviews.compactMap({ $0 as? UIImageView}).first {
                self.performSpringAnimation(imgView: subView)
            }
        }
    }
}
