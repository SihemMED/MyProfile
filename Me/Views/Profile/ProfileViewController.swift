//
//  ProfileViewController.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/1/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit
protocol ProfileViewControllerDelegate: class {
    func sendEmail(_ email: String)
    func showLinkedinProfile(_ url : String)
    func showGithubProfile(_ url : String)
    func callMe(_ phoneNumber : String)
}

class ProfileViewController: UIViewController {

    private let controller: ProfileController
    private var profile: Profile?
    weak var delegate: ProfileViewControllerDelegate?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var function: UILabel!
    @IBOutlet weak var addess: UILabel!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var skillsView: UIView!
    
    @IBAction func sendEmail(_ sender: Any) {
        if let email = profile?.email {
            delegate?.sendEmail(email)
        }
    }
    
    @IBAction func showLinkedinProfile(_ sender: Any) {
        if let url = profile?.linkedin {
            delegate?.showLinkedinProfile(url)
        }
    }
    
    @IBAction func showGithubProfile(_ sender: Any) {
        if let url = profile?.github {
            delegate?.showGithubProfile(url)
        }
    }
    
    @IBAction func callMe(_ sender: Any) {
        if let phoneNumber = profile?.phoneNumber {
            delegate?.callMe(phoneNumber)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        profile = controller.getProfile()
        setupUI()
    }

    init(controller: ProfileController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        profileImage.image = UIImage(named: "sihem")
        name.text = profile?.name
        addess.text = profile?.address
        function.text = profile?.function
        summary.attributedText = controller.getSummary()
        buttonsView.addBorder(toSide: [.Top, .Bottom], withColor: UIColor.lightGray.withAlphaComponent(0.3), andThickness: 1)
        let skillsController = SkillsController()
        let skillsViewController = SkillsViewController(controller: skillsController)
        add(child: skillsViewController, to: skillsView)
    }
}
