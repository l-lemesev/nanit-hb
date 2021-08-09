//
//  Shareable.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/9/21.
//

import Foundation
import UIKit


protocol Shareable: UIViewController {
    
    func shareView(exclue controls: [UIView])
}


extension Shareable {
    
    func shareView(exclue controls: [UIView]) {
        toggleControlsVisibility(controls)
        
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        toggleControlsVisibility(controls)
        
        
        present(UIActivityViewController(activityItems: [image],
                                         applicationActivities: nil),
                animated: true,
                completion: nil)
    }
    
    
    private func toggleControlsVisibility(_ controls: [UIView]) {
        controls.forEach { $0.isHidden = !$0.isHidden }
    }
}
