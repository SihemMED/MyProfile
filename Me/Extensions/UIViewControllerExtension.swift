//
//  UIViewControllerExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/28/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(child childViewController: UIViewController, to containerView: UIView? = nil) {
        var containerView = containerView
        if containerView == nil {
            containerView = view
        }
        self.addChild(childViewController)
        containerView?.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childViewController.view.topAnchor.constraint(equalTo: containerView!.topAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: containerView!.bottomAnchor),
            childViewController.view.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: containerView!.trailingAnchor)
            ])
    }
    
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
