//
//  DOBViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class DOBViewController: FirstLaunchViewController {
    
    var dateOfBirth: Date?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toPPPicker" {
            if let destination = segue.destination as? FirstLaunchViewController {
                destination.profile = self.profile
            }
        }
    }
 

    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        self.dateOfBirth = sender.date
    }
    
    
    
    @IBAction func nextDidTouch(_ sender: Any) {
        super.profile?.dateOfBirth = dateOfBirth!
    }
    
}
