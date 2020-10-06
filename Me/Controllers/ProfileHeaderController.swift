//
//  ProfileHeaderController.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/28/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation

class ProfileHeaderController {
    func getProfile() -> Profile? {
        var profile: Profile?
        JSONHelper().getProfileFromJSON(file: "profile") { (result) in
            switch result {
            case .success(let response):
                profile = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return profile
    }
}
