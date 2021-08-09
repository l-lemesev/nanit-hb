//
//  UIImageView+Border.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/8/21.
//

import Foundation
import UIKit


extension UIImageView {
    
    func addBorder(_ color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 7
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }
}
