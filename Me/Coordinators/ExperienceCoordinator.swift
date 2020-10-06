//
//  ExperienceCoordinator.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/1/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class ExperienceCoordinator: UINavigationController, Coordinator {
    
    func setupCoordinator() {
        setupNavigationController(isBarHidden: true)
        setTransparentNavigationBar()
        let experienceController = ExperienceController()
        let experienceViewController = ExperienceViewController(controller: experienceController)
        experienceViewController.delegate = self
        self.pushViewController(experienceViewController, animated: true)
    }
    
    private func setupNavigationController(isBarHidden: Bool) {
        self.isNavigationBarHidden = isBarHidden
        self.navigationBar.backItem?.title = ""
    }

}

extension ExperienceCoordinator: ExperienceViewControllerDelegate {
    func showDetails(experience: Experience) {
        let detailsVC = ExperienceDetailsViewController(experience: experience)
        detailsVC.delegate = self
        self.pushViewController(detailsVC, animated: true)
        setupNavigationController(isBarHidden: false)
        
    }
}

extension ExperienceCoordinator: ExperienceDetailsViewControllerDelegate {
    func showAppOnStore(_ itemUrl: String) {
        let webViewController = WebViewController(url: itemUrl)
        self.pushViewController(webViewController, animated: true)
        setupNavigationController(isBarHidden: false)
    }
    
}
