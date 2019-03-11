//
//  TwentyQuestionsIcebreaker.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-11.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class TwoTruthsOneLieIcebreaker: Icebreaker{
    var truthOne: String
    var truthTwo: String
    var lie: String
    
    init?(){
      
        truthOne = ""
        truthTwo = ""
        lie = ""
        
        super.init(title: "Almost done! All thats left, is two truths and a lie for your profile.")

    }
}
