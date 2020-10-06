//
//  ExperienceTableViewCell.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/28/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class HomeExperienceTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(item: [String:String]) {
        let function = item["function"] ?? ""
        let company = item["companyName"] ?? ""
        title.text = String(format: "%@ - %@", function , company )
        let startDate = item["startDate"]
        let endDate = item["endDate"]
        let periode = calculatePeriod(startDate: startDate, endDate: endDate)
        let location = item["location"] ?? ""
        subtitle.text = String(format: "%@ - %@", periode, location)
        let firstCharacter = company.first?.lowercased() ?? "c"
        logo.image = UIImage(systemName: firstCharacter+".circle.fill")
        logo.tintColor = Style.Colors.mongo
        if let logoUrl = item["companyLogo"], let url = URL(string: logoUrl ) {
            logo.loadImageFrom(url: url)
        }
    }
    
    private func calculatePeriod(startDate: String?, endDate: String?) -> String {
        guard let startDate = startDate?.toDate, let endDate = endDate?.toDate else { return "" }
        
        return calculatePeriod(startDate: startDate, endDate: endDate)
    }
    
    private func calculatePeriod(startDate: Date, endDate: Date) -> String {
        var period = ""
        let diffComponents = Calendar.current.dateComponents([.month, .year], from: startDate, to: endDate)
        guard let month = diffComponents.month, let year = diffComponents.year else {
            return period
        }
        
        if year > 1 {
            if month > 1 {
                period = String(format: "%d years and %d months", year, month)
            } else {
                period = String(format: "%d years and 1 month", year)
            }
        } else if year == 1 {
            if month > 1 {
                period = String(format: "%d year and %d months", year, month)
            } else {
                period = String(format: "%d year and 1 month", year)
            }
        }
        else {
            period = String(format: "%d months", month)
        }
        return period
    }
    
//    private func convertStringToDate(date: String?) -> Date {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        if let date = date {
//            return formatter.date(from: date) ?? Date()
//        }
//        return Date()
//    }
}
