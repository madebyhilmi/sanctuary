//
//  IcebreakerViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class IcebreakerViewController: FirstLaunchViewController {


    @IBOutlet weak var truthOneTextField: UITextField!
    @IBOutlet weak var truthTwoTextField: UITextField!
    @IBOutlet weak var lieTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStart" {
            if let destination = segue.destination as? SubViewController {
                destination.profile = self.profile
            }
        }
    }
    @IBAction func doneDidPress(_ sender: Any) {
        super.profile?.icebreaker.truthOne = truthOneTextField.text!
        super.profile?.icebreaker.truthTwo = truthTwoTextField.text!
        super.profile?.icebreaker.lie = lieTextField.text!

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ReadyScreen") as UIViewController
        present(vc, animated: true, completion: nil)
    }
    

}
