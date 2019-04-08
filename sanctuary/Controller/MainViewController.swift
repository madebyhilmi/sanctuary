//
//  MainViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-04-08.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var profile: Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
