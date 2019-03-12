//
//  SubViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class SubViewController: UINavigationController , UINavigationControllerDelegate {
    
    var profile: Profile?
    
    override func viewDidLoad() {
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if let destination = viewController as? FirstLaunchViewController {
            if profile != nil {
                destination.profile = self.profile
            }else{
                print("issue")
            }
        }
    }
}
