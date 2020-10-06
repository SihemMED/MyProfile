//
//  StringExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/30/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation

extension String {
    var toDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        if !self.isEmpty {
            return formatter.date(from: self) ?? Date()
        }
        return Date()
    }
}
