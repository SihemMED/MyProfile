//
//  ExperienceController.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/30/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation

enum ExperienceFilter: String {
    case all = "All"
    case professional = "Professional"
    case internship = "Internship"
    
    var status: String {
        switch self {
        case .all:
            return "All"
        case .professional:
            return "Professional"
        case .internship:
            return "Internship"
        
        }
    }
}

class ExperienceController {
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
    
    func filterExperienceBy(_ filter: ExperienceFilter, completionHandler: @escaping (_ items: [Experience]) -> Void) {
        let experienceArray = getExperience()
        switch filter {
        case .all:
            completionHandler(experienceArray)
        case .professional:
            completionHandler(experienceArray.filter({$0.type == filter.status}))
        case .internship:
            completionHandler(experienceArray.filter({$0.type == filter.status}))
        }
        
    }
}
