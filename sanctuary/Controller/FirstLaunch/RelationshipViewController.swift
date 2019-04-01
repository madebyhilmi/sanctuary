//
//  RelationshipViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-04-01.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class RelationshipViewController: FirstLaunchViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDOB" {
            if let destination = segue.destination as? SubViewController {
                destination.profile = self.profile
            }
        }
    }
 

    @IBAction func lookingForCasual(_ sender: Any) {
        self.profile?.orientation = "Casual"
    }
    @IBAction func lookingForShortterm(_ sender: Any) {
        self.profile?.orientation = "Short-term"
    }
    @IBAction func lookingForLongterm(_ sender: Any) {
        self.profile?.orientation = "Long-term"
    }
    
    
    
}
