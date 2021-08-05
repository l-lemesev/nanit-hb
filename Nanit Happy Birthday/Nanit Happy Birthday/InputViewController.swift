//
//  ViewController.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/5/21.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfBirthday: UITextField!
    
    @IBOutlet weak var ivPicture: UIImageView!
    
    @IBOutlet weak var btnShowBdScreen: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func choosePicture() {
        
    }
    
    
    @IBAction func showBirthdayScreen() {
        
    }
}


extension InputViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        btnShowBdScreen.isEnabled = tfName.text?.isEmpty == false && tfBirthday.text?.isEmpty == false
    }
}

