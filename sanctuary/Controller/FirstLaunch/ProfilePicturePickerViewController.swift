//
//  ProfilePicturePickerViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class ProfilePicturePickerViewController: FirstLaunchViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPPPicked" {
            if let destination = segue.destination as? FirstLaunchViewController {
                destination.profile = self.profile
            }
        }
    }
    @IBAction func openCameraRoll(_ sender: Any) {
        ImagePickerManager().pickImage(self){ image in
            self.profile?.profilePic = image
            self.performSegue(withIdentifier: "toPPPicked", sender: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "pppicked") as! ProfilePicturePickedViewController
            vc.profile = self.profile
            self.present(vc, animated: true, completion: nil)
        }
    }
   
}
