//
//  Theme.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/7/21.
//

import Foundation
import UIKit


protocol Theme {
    
    var bgImageName: String { get }
    
    var placeHolderImageName: String { get }
    
    var accentColor: UIColor { get }
    
    var cameraImageName: String { get }
    
    var backgroundColor: UIColor { get }
}


func getRandomTheme() -> Theme {
    return [BlueTheme(), GreenTheme(), YellowTheme()].randomElement() as! Theme
}


struct BlueTheme: Theme {
    
    var bgImageName: String = "iOsBgPelican"
    
    var placeHolderImageName: String = "defaultPlaceHolderBlue"
    
    var accentColor: UIColor = UIColor(red: 139.0 / 255.0, green: 211.0 / 255.0, blue: 228.0 / 255.0, alpha: 1)
    
    var cameraImageName: String = "cameraIconBlue"
    
    var backgroundColor: UIColor = UIColor(red: 218.0 / 255.0, green: 241.0 / 255.0, blue: 246.0 / 255.0, alpha: 1)
}


struct GreenTheme: Theme {
    
    var bgImageName: String = "iOsBgFox"
    
    var placeHolderImageName: String = "defaultPlaceHolderGreen"
    
    var accentColor: UIColor = UIColor(red: 111.0 / 255.0, green: 197.0 / 255.0, blue: 175.0 / 255.0, alpha: 1)
    
    var cameraImageName: String = "cameraIconGreen"
    
    var backgroundColor: UIColor = UIColor(red: 197.0 / 255.0, green: 232.0 / 255.0, blue: 223.0 / 255.0, alpha: 1)
}


struct YellowTheme: Theme {
    
    var bgImageName: String = "iOsBgElephant"
    
    var placeHolderImageName: String = "defaultPlaceHolderYellow"
    
    var accentColor: UIColor = UIColor(red: 254.0 / 255.0, green: 190.0 / 255.0, blue: 32.0 / 255.0, alpha: 1)
    
    var cameraImageName: String = "cameraIconYellow"
    
    var backgroundColor: UIColor = UIColor(red: 254.0 / 255.0, green: 239.0 / 255.0, blue: 203.0 / 255.0, alpha: 1)
}
