//
//  Experience.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/29/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation
struct Experience: Decodable {
    let id: Int
    let function: String
    let startDate: String
    let endDate: String?
    let company: Company
    let job: Job
    let applications: [ApplicationOnStore]
    let platforms: String?
    let type: String?
    var dictionary: [String: String?] {
        return ["function": function,
                "companyName": company.name,
                "companyLogo": company.logo,
                "startDate": startDate,
                "endDate": endDate,
                "location": company.location]
    }
}

struct Company: Decodable {
    let name: String
    let logo: String?
    let phoneNumber: String?
    let webSite: String?
    let location: String?
    let locationOnMap: String?
}

struct Job: Decodable {
    let description: [DictionaryValue]
    let keyAchievement: [DictionaryValue]
    let tools: String
}

struct ApplicationOnStore: Decodable {
    let id : Int
    let name: String
    let url: String
    let logo: String
    let description: String
}

struct DictionaryValue: Decodable {
    let value: String
}
