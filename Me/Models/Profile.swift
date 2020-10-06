//
//  Profile.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/2/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation
struct Profile: Decodable {
    let name: String
    let function: String
    let phoneNumber: String
    let email: String
    let address: String
    let numberOfExperience: String
    let linkedin: String
    let github: String
    let summary: [DictionaryValue]
}
