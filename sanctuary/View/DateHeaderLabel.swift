//
//  DateHeaderLabel.swift
//  sanctuary
//
//  Created by Stuart Seguin on 2019-03-30.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0xb2/255, green: 0x4e/255, blue: 0x6a/255, alpha: 0.6)
//        backgroundColor = UIColor(red: 0xff/255, green: 0x49/255, blue: 0x7e/255, alpha: 0.5)

        textColor = .white
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false //enable auto-layout
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        font = UIFont.boldSystemFont(ofSize: 12)
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height/2
        layer.masksToBounds = true  //make corners round
        
        return CGSize(width: originalContentSize.width + 16, height: height)
    }
}
