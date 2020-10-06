//
//  Style.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/27/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

enum Style {
    enum Colors {
        static let black = UIColor(named: "Black") ?? UIColor.black
        static let white = UIColor(named: "White") ?? UIColor.white
        static let tetarium = UIColor(named: "Tetarium") ?? UIColor.brown
        static let mongo = UIColor(named: "Mongo") ?? UIColor.yellow
    }
    enum Font {
        static let body = UIFont.preferredFont(forTextStyle: .body)
        static let bold17 = UIFont.boldSystemFont(ofSize: 17)
    }
    enum Pragraph {
        static let style = NSMutableParagraphStyle()
    }
}

