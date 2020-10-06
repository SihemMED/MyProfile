//
//  UIImageViewExtension.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/29/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
