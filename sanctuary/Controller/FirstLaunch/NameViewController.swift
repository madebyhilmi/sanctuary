//
//  NameViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class NameViewController: FirstLaunchViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toGender" {
            if let destination = segue.destination as? SubViewController {
                destination.profile = self.profile
            }
        }
    }

    @IBAction func nextDidTouch(_ sender: Any) {
        super.profile!.name = nameTextField.text!
    }
}
