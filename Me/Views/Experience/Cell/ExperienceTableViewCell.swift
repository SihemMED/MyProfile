//
//  ExperienceTableViewCell.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/30/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

    @IBOutlet weak var function: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var publishedAppsCount: UILabel!
    @IBOutlet weak var platform: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0))
    }
    
    func setupCell(_ item: Experience) {
        function.text = item.function
        let company = item.company.name
        companyName.text = String(format: "%@ - %@", company, item.company.location ?? "")
        startDate.text = item.startDate.toDate.formattedDate(format: "MMM yyyy")
        if let date = item.endDate , !date.isEmpty {
            endDate.text = date.toDate.formattedDate(format: "MMM yyyy")
        }else{
            endDate.text = "Now"
        }
        publishedAppsCount.text = "\(item.applications.count)"
        platform.text = item.platforms
        let firstCharacter = company.first?.lowercased() ?? "c"
        companyLogo.image = UIImage(systemName: firstCharacter+".circle.fill")
        companyLogo.tintColor = .white
        if let logoUrl = item.company.logo, let url = URL(string: logoUrl ) {
            companyLogo.loadImageFrom(url: url)
        }
    }
}
