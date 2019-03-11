//
//  Profile.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class Profile {
    //MARK: Properties
    var name: String
    var phoneNumberString : String
    var email: String
    var profilePic: UIImage
    var gender: String
    var dateOfBirth: Date
    var icebreaker: TwoTruthsOneLieIcebreaker
    var complete: Bool
    
    init?(){
        self.complete = false
        
        //Initialize Placeholders
        self.name = ""
        self.phoneNumberString = ""
        self.email = ""
        self.profilePic = UIImage(named: "jessica")!
        self.gender = "Male"
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy/MM/dd HH:mm"
        self.dateOfBirth = dateFormatterGet.date(from: "2016/10/08 22:31")!
        self.icebreaker = TwoTruthsOneLieIcebreaker()!
        
    }
    
    
}
