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
        
        backgroundColor = .black
        textColor = .white
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false //enable auto-layout
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        font = UIFont.boldSystemFont(ofSize: 14)
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height/2
        layer.masksToBounds = true  //make corners round
        
        return CGSize(width: originalContentSize.width + 16, height: height)
    }
}
