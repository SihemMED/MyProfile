//
//  SkillCollectionViewCell.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/5/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var currentSelectedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(_ item: Skill) {
        skillName.text = item.name
        if !item.image.isEmpty {
            skillImage.image = UIImage(named: item.image)
            skillImage.backgroundColor = .clear
        }else {
            let name = item.name.first?.lowercased() ?? "u"
            skillImage.image = UIImage(systemName: name+".square")
            skillImage.backgroundColor = .random
            skillImage.tintColor = .white
        }
        
    }

}
