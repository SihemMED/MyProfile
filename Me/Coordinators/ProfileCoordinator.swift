//
//  ProfileCoordinator.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/2/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit
import MessageUI

class ProfileCoordinator: UINavigationController, Coordinator {
    
    func setupCoordinator() {
        setupNavigationController(isBarHidden: true)
        setTransparentNavigationBar()
        let profileController = ProfileController()
        let profileViewController = ProfileViewController(controller: profileController)
        profileViewController.delegate = self
        self.pushViewController(profileViewController, animated: true)
    }
    
    private func setupNavigationController(isBarHidden: Bool) {
        self.isNavigationBarHidden = isBarHidden
        self.navigationBar.backItem?.title = ""
    }
}

extension ProfileCoordinator: ProfileViewControllerDelegate {
    func sendEmail(_ email: String) {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([email])
        mail.setSubject(email)
        mail.setMessageBody(email, isHTML: false)
        if MFMailComposeViewController.canSendMail() {
            self.present(mail, animated: true, completion: nil)
        } else {
            // show failure alert
        }
    }
    
    func showLinkedinProfile(_ url: String) {
        let webViewController = WebViewController(url: url)
        self.pushViewController(webViewController, animated: true)
        setupNavigationController(isBarHidden: false)
    }
    
    func showGithubProfile(_ url: String) {
        let webViewController = WebViewController(url: url)
        self.pushViewController(webViewController, animated: true)
        setupNavigationController(isBarHidden: false)
    }
    
    func callMe(_ phoneNumber: String) {
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension ProfileCoordinator: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
