//
//  AchievementTableViewCell.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/1/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {
    @IBOutlet weak var achievementLabel: UILabel!
    @IBOutlet weak var achievementView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(items: [DictionaryValue], section: Int) {
        achievementView.borderColor = section == 1 ? Style.Colors.mongo : .clear
        var achievement = ""
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = Style.Colors.black
        let bullet = "•  "
        let paragraphStyle = NSMutableParagraphStyle()
        attributes[.paragraphStyle] = paragraphStyle
        
        if items.count > 1 {
            paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
            let achievements = items.map({ return bullet + $0.value})
            achievement = achievements.joined(separator: "\n\n")
        }else if items.count == 1 {
            paragraphStyle.firstLineHeadIndent = section == 1 ? 0 : 20
            paragraphStyle.headIndent = section == 1 ? 0 : 20
            achievement = items[0].value
        }
        var achievementAttributedString: NSMutableAttributedString = NSMutableAttributedString()
        if section == 2 || section == 3{
            let title = section == 2 ? "Key Achievement: \n\n" : "Published Applications"
            achievementAttributedString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: Style.Colors.black])
        }
        achievementAttributedString.append(NSAttributedString(string: achievement, attributes: attributes))
        if items.count != 0 {
            achievementLabel.attributedText = achievementAttributedString
        }
    }
}
