//
//  ApplicationTableViewCell.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/1/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class ApplicationTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var applicationName: UILabel!
    @IBOutlet weak var applicationDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(_ application: ApplicationOnStore) {
        let name = application.name
        let firstCharacter = name.first?.lowercased() ?? "c"
        logo.image = UIImage(systemName: firstCharacter+".circle.fill")
        logo.tintColor = Style.Colors.mongo
        let logoUrl = application.logo
        if let url = URL(string: logoUrl ) {
            logo.loadImageFrom(url: url)
        }
        applicationName.text = name
        applicationDescription.text = application.description
    }
    
}
