//
//  GenderViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class GenderViewController: FirstLaunchViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toOrientation" {
            if let destination = segue.destination as? SubViewController {
                destination.profile = self.profile
            }
        }
    }
    
    @IBAction func maleDidTouch(_ sender: Any) {
        super.profile?.gender = "male"
    }
    @IBAction func femaleDidTouch(_ sender: Any) {
        super.profile?.gender = "female"
    }
    @IBAction func nonbinaryDidTouch(_ sender: Any) {
        super.profile?.gender = "nonbinary"
    }
    

    
}
