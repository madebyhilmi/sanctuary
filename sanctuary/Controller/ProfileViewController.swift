//
//  ProfileViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-06.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class ProfileViewController: MainViewController {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var schoolField: UILabel!
    @IBOutlet weak var stateField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (profile != nil){
            profilePicture.image = profile?.profilePic
            nameLabel.text = profile?.name
            schoolField.text = "University of Calgary"
            stateField.text = "Calgary, AB"
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func editProfile(_ sender: Any) {
    }
    
}
