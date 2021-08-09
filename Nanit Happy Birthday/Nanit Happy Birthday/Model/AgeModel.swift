//
//  AgeModel.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/7/21.
//

import Foundation
import UIKit


struct AgeModel {
    
    let firstLine: String
    
    let secondLine: String
    
    let imageName: String
    
    
    func fill(_ info: ChildInfoUI) {
        info.lblName.text = firstLine
        info.ivNumber.image = UIImage(named: imageName)
        info.lblAge.text = secondLine
    }
}
