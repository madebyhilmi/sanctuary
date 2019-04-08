//
//  PhoneNumberViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit
import PhoneNumberKit
import SkyFloatingLabelTextField

class PhoneNumberViewController: FirstLaunchViewController {

    
    @IBOutlet weak var phoneNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var phoneNumberKit: PhoneNumberKit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        phoneNumberKit = PhoneNumberKit()
        phoneNumberTextField.addTarget(self, action: #selector(phoneNumberTextFieldDidChange(textField:)), for: .editingChanged)

        //Initialize Profile
        super.profile = Profile()
        

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toName" {
            if let destination = segue.destination as? FirstLaunchViewController {
                destination.profile = self.profile
            }
        }
    }

    @IBAction func nextDidTouch(_ sender: Any) {
        let phoneNumberString = phoneNumberTextField.text
        super.profile = Profile()!
        profile!.phoneNumberString = phoneNumberString!
    }

    @objc func phoneNumberTextFieldDidChange(textField: UITextField) {
        do {
            let phoneNumber = try phoneNumberKit!.parse(textField.text!)
            phoneNumberTextField.title = "Phone Number"
            phoneNumberTextField.tintColor = UIColor.white
            phoneNumberTextField.selectedTitleColor = UIColor.white
            phoneNumberTextField.selectedLineColor = UIColor.white
            phoneNumberTextField.textColor = UIColor.white
            nextButton.isEnabled = true
            nextButton.alpha = 1.0
            
        }
        catch {
            //phoneNumberTextField.errorMessage = "Invalid Phone Number"
            phoneNumberTextField.placeholder = "Phone Number"
            phoneNumberTextField.title = "Invalid Phone Number"
            phoneNumberTextField.tintColor = UIColor(named: "orange")
            phoneNumberTextField.selectedTitleColor = UIColor(named: "orange")!
            phoneNumberTextField.selectedLineColor = UIColor(named: "orange")!
            phoneNumberTextField.textColor = UIColor(named: "orange")
            nextButton.isEnabled = false
            nextButton.alpha = 0.5
        }
    }
    
    
}
