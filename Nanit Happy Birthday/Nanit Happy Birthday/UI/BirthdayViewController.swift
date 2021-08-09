//
//  BirthdayViewController.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/5/21.
//

import UIKit



class BirthdayViewController: UIViewController, ChildInfoUI, Themeable, Shareable {
    

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var ivNumber: UIImageView!
    
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var ivPicture: UIImageView!
    
    @IBOutlet weak var btnCamera: UIButton!
    
    @IBOutlet weak var ivBackground: UIImageView!
    
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    
    private var imagePicker: ImagePicker!
    
    private var theme: Theme!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        theme = applyRandomTheme(to: self)
        
        loadInput()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        ivPicture.addBorder(theme.accentColor)
        handleCameraButtonPosition()
    }
    
    
    @IBAction func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cameraAction() {
        imagePicker.present()
    }
    
    
    @IBAction func shareAction() {
        shareView(exclue: [btnBack, btnCamera, btnShare])
    }
    
    
    private func handleCameraButtonPosition() {
        let centerXconstraint = view.subviews.map { $0.constraints.first(where: { $0.identifier == "centerX" }) }.first
        let centerYconstraint = view.subviews.map { $0.constraints.first(where: { $0.identifier == "centerY" }) }.first
        
        
        let radians = 225.0 * .pi / 180.0
        let radius = ivPicture.frame.width / 2
        let newX = ivPicture.center.x + radius * CGFloat(cos(radians))
        let newY = ivPicture.center.y - radius * CGFloat(sin(radians))
        
        centerXconstraint??.constant = ivPicture.center.x - newX
        centerYconstraint??.constant = ivPicture.center.y - newY
    }
}


extension BirthdayViewController: ImagePickerDelegate {
    
    
    func didSelect(image: UIImage?) {
        var userInput = UserInput.fromPersistence()
        userInput?.pictureData = image?.pngData()
        userInput?.save()
        
        ivPicture.image = image
    }
}
