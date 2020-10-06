//
//  Education.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/29/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation
struct Education: Decodable {
    let id: Int
    let function: String
    let startDate: String
    let endDate: String?
    let speciality: String
    let school: School
    let academicProject: [AcademicProject]
    var dictionary: [String: String?] {
        return ["function": function,
                "companyName": school.name,
                "companyLogo": school.logo,
                "startDate": startDate,
                "endDate": endDate,
                "location": school.location]
    }
    
    
}

struct School: Decodable {
     let name: String
       let logo: String?
       let phoneNumber: String?
       let webSite: String?
       let location: String?
       let locationOnMap: String?
}

struct AcademicProject: Decodable {
    let id: Int
    let name: String
    let description: String
}
