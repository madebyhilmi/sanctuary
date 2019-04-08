//
//  ReadyScreenViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-06.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class ReadyScreenViewController: MainViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMyProfile" {
            if let destination = segue.destination as? MainViewController {
                destination.profile = self.profile
            }
        }
    }
 
    @IBAction func editProfileClicked(_ sender: Any) {
        
    }
    
    
    
}
