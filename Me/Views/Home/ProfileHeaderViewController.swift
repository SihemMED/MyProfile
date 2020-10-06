//
//  ProfileHeaderViewController.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/28/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class ProfileHeaderViewController: UIViewController {

    private let controller: ProfileHeaderController!
    private var profile: Profile?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var function: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var experience: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    init(controller: ProfileHeaderController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        profile = controller.getProfile()
        name.text = profile?.name
        function.text = profile?.function
        phoneNumber.text = profile?.phoneNumber
        email.text = profile?.email
        experience.text = profile?.numberOfExperience
    }
}
