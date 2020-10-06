//
//  ProfileController.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/2/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation

class ProfileController {
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
    
    func getSummary() -> NSAttributedString {
        if let items = getProfile()?.summary {
            var attributes = [NSAttributedString.Key: Any]()
            attributes[.font] = Style.Font.body
            attributes[.foregroundColor] = Style.Colors.black
            let bullet = "•  "
            let paragraphStyle = Style.Pragraph.style
            attributes[.paragraphStyle] = paragraphStyle
            paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
            let summaryItems = items.map({ return bullet + $0.value})
            let summary = summaryItems.joined(separator: "\n\n")
            
            var summaryAttributedString: NSMutableAttributedString = NSMutableAttributedString()
            let title = "Summary: \n\n"
            summaryAttributedString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : Style.Font.bold17, NSAttributedString.Key.foregroundColor: Style.Colors.black])
            summaryAttributedString.append(NSAttributedString(string: summary, attributes: attributes))
            return summaryAttributedString
        }
        return NSAttributedString()
    }
}
