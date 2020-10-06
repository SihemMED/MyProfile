//
//  SkillsController.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/5/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation
class SkillsController {
    
    func getSkills() -> [Skill] {
        var skills: [Skill] = []
        JSONHelper().getSkillsFromJSON(file: "skills") { (result) in
            switch result {
            case .success(let response):
                skills = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return skills
    }
}
