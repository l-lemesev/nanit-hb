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
    
    private var imagePicker: ImagePicker!
    
    
    private var input: UserInput!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        tfBirthday.setInputViewDatePicker(target: self, selector: #selector(doneTap))
        
        loadInput()
    }
    
    private func loadInput() {
        guard let savedInput = UserInput.fromPersistence() else {
            input = UserInput(name: "", birthday: Date(), pictureData: nil)
            return
        }
        
        input = savedInput
        
        tfName.text = input.name
        showBirthdayText(input.birthday)
        
        
        if let pictureData = input.pictureData {
            ivPicture.image = UIImage(data: pictureData)
        }
        
        enableShowBirthdayButtonIfNeeded()
    }

    
    @IBAction func choosePicture() {
        imagePicker.present()
    }
    
    
    @IBAction func showBirthdayScreen() {
        performSegue(withIdentifier: "showBirthday", sender: nil)
    }
    
    
    @objc private func doneTap() {
        if let datePicker = tfBirthday.inputView as? UIDatePicker {
            input.birthday = datePicker.date
            showBirthdayText(datePicker.date)
        }
        
        tfBirthday.resignFirstResponder()
    }
    
    
    private func showBirthdayText(_ bd: Date?) {
        guard let bd = bd else { return }
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        tfBirthday.text = dateformatter.string(from: bd)
    }
    
    
    private func enableShowBirthdayButtonIfNeeded() {
        btnShowBdScreen.isEnabled = tfName.text?.isEmpty == false && tfBirthday.text?.isEmpty == false
    }
}


extension InputViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == tfName {
            input.name = tfName.text ?? ""
            input.save()
        }
        
        enableShowBirthdayButtonIfNeeded()
    }
}



extension InputViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        ivPicture.image = image
        input.pictureData = image?.pngData()
    }
}
