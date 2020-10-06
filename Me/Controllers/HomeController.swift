//
//  HomeController.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/28/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation

class HomeController {
    init() {
        
    }
    
    func getExperience() -> [Experience] {
        var experience: [Experience] = []
        JSONHelper().getExperienceFromJSON(file: "experience") { (result) in
            switch result {
            case .success(let response):
                experience = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return experience
    }
    
    func getEducation() -> [Education] {
        var education: [Education] = []
        JSONHelper().getEducationFromJSON(file: "education") { (result) in
            switch result {
            case .success(let response):
                education = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return education
    }
}
