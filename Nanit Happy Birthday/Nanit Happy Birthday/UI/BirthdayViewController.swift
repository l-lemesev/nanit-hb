//
//  BirthdayViewController.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/5/21.
//

import UIKit


class BirthdayViewController: UIViewController {
    

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var ivNumber: UIImageView!
    
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var ivPlaceholder: UIImageView!
    
    @IBOutlet weak var btnCamera: UIButton!
    
    @IBOutlet weak var ivBackground: UIImageView!

    
    private var theme = getRandomTheme()
    
    private let placeholderBorderWidth: CGFloat = 7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        applyTheme()
        loadInput()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        ivPlaceholder.layer.borderColor = theme.accentColor.cgColor
        ivPlaceholder.layer.borderWidth = placeholderBorderWidth
        ivPlaceholder.layer.cornerRadius = ivPlaceholder.frame.size.width / 2
        ivPlaceholder.layer.masksToBounds = true
        
        handleCameraButtonPosition()
    }
    
    
    @IBAction func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cameraAction() {
        
    }
    
    
    private func applyTheme() {
        ivBackground.image = UIImage(named: theme.bgImageName)
        ivPlaceholder.image = UIImage(named: theme.placeHolderImageName)
        btnCamera.setImage(UIImage(named: theme.cameraImageName), for: .normal)
        view.backgroundColor = theme.backgroundColor
    }
    
    
    private func loadInput() {
        guard let userInput = UserInput.fromPersistence(),
              let name = userInput.name,
              let birthday = userInput.birthday else { return }
        
        let ageModel = birthday.getAgeModel(name: name)
        
        lblName.text = ageModel.firstLine
        ivNumber.image = UIImage(named: ageModel.imageName)
        lblAge.text = ageModel.secondLine
    }
    
    
    private func handleCameraButtonPosition() {
        let centerXconstraint = view.subviews.map { $0.constraints.first(where: { $0.identifier == "centerX" }) }.first
        let centerYconstraint = view.subviews.map { $0.constraints.first(where: { $0.identifier == "centerY" }) }.first
        
        
        centerYconstraint??.constant = 0 - (ivPlaceholder.frame.width / 2 - btnCamera.frame.width - placeholderBorderWidth / 2)
        centerXconstraint??.constant = ivPlaceholder.frame.height / 2 - btnCamera.frame.height - placeholderBorderWidth / 2
    }
}
