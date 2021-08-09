//
//  Themeable.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/9/21.
//

import Foundation
import UIKit


protocol Themeable {
    
    var view: UIView! { get }
    
    var ivBackground: UIImageView! { get }
    
    var ivPicture: UIImageView! { get }
    
    var btnCamera: UIButton! { get }
}
