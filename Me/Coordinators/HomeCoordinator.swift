//
//  HomeCoordinator.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/1/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class HomeCoordinator: UINavigationController, Coordinator {
    
    func setupCoordinator() {
        setupNavigationController(isBarHidden: true)
        setTransparentNavigationBar()
        let homeController = HomeController()
        let homeViewController = HomeViewController(controller: homeController)
        homeViewController.delegate = self
        self.pushViewController(homeViewController, animated: true)
    }
    
    private func setupNavigationController(isBarHidden: Bool) {
        self.isNavigationBarHidden = isBarHidden
        self.navigationBar.backItem?.title = ""
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func showExperienceDetails(_ experience: Experience) {
        let detailsVC = ExperienceDetailsViewController(experience: experience)
        //detailsVC.delegate = self
        self.pushViewController(detailsVC, animated: true)
        setupNavigationController(isBarHidden: false)
    }
}
