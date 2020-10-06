//
//  DateExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/30/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation
extension Date {
    func formattedDate(format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
