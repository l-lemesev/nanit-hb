//
//  ChildInfoUI.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/9/21.
//

import Foundation
import UIKit


protocol ChildInfoUI {
    
    var lblName: UILabel! { get }
    
    var ivNumber: UIImageView! { get }
    
    var lblAge: UILabel! { get }
    
    var ivPicture: UIImageView! { get }
}


extension ChildInfoUI {
    
    func loadInput() {
        guard let userInput = UserInput.fromPersistence(),
              let name = userInput.name,
              let birthday = userInput.birthday else { return }
        
        birthday.getAgeModel(name: name).fill(self)
        
        
        if let pictureData = userInput.pictureData {
            ivPicture.image = UIImage(data: pictureData)
        }
    }
}
