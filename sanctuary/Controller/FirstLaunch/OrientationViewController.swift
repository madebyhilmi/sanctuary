//
//  OrientationViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-04-01.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class OrientationViewController: FirstLaunchViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRelationshipType" {
            if let destination = segue.destination as? FirstLaunchViewController {
                destination.profile = self.profile
            }
        }
    }
    @IBAction func lookingForMale(_ sender: Any) {
        super.profile?.orientation = "male"

    }
    @IBAction func lookingForFemale(_ sender: Any) {
        super.profile?.orientation = "female"
    }
    @IBAction func lookingForNonbinary(_ sender: Any) {
        super.profile?.orientation = "nonbinary"
    }
    
    

}
