//
//  AppCoordinator.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/1/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow
    private var coordinators = [String: Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func setupCoordinator() {
        let tabBarController = CustomTabBarController()
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.tabBarItem.image = UIImage(systemName: "house.fill")
        homeCoordinator.setupCoordinator()
        
        let experienceCoordinator = ExperienceCoordinator()
        experienceCoordinator.tabBarItem.image = UIImage(systemName: "briefcase.fill")
        experienceCoordinator.setupCoordinator()
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.tabBarItem.image = UIImage(systemName: "person.fill")
        profileCoordinator.setupCoordinator()
        
        tabBarController.viewControllers = [homeCoordinator, experienceCoordinator, profileCoordinator]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
