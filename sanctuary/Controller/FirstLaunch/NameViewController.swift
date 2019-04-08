//
//  NameViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField


class NameViewController: FirstLaunchViewController {
    
    
    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        nameTextField.becomeFirstResponder()
        nameTextField.addTarget(self, action: #selector(onChange(textField:)), for: .editingChanged)


        
    }


    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toGender" {
            if let destination = segue.destination as? FirstLaunchViewController {
                destination.profile = self.profile
            }
        }
    }

    @objc func onChange(textField: UITextField) {
        if (nameTextField.text?.count)! < 1 {
            nameTextField.placeholder = "Name"
            nameTextField.title = "Invalid Name"
            nameTextField.tintColor = UIColor(named: "orange")
            nameTextField.selectedTitleColor = UIColor(named: "orange")!
            nameTextField.selectedLineColor = UIColor(named: "orange")!
            nameTextField.textColor = UIColor(named: "orange")
            
            nextButton.isEnabled = false
            nextButton.alpha = 0.5
        }else{
            nameTextField.title = "Name"
            nameTextField.tintColor = UIColor.white
            nameTextField.selectedTitleColor = UIColor.white
            nameTextField.selectedLineColor = UIColor.white
            nameTextField.textColor = UIColor.white
            
            nextButton.isEnabled = true
            nextButton.alpha = 1.0
        }
    }
    
    
    @IBAction func nextDidTouch(_ sender: Any) {
        super.profile!.name = nameTextField.text!
    }
}
