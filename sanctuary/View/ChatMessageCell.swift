//
//  ChatMessageCell.swift
//  sanctuary
//
//  Created by Stuart Seguin on 2019-03-20.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bubbleBackgroundView.backgroundColor = .green
        bubbleBackgroundView.layer.cornerRadius = 15
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLabel)
        messageLabel.text = "Some really really long message that should span quite a few lines so that we can see what these bubbles will look like"
        messageLabel.numberOfLines = 0 //word wrap
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //contsraints for label
        let constraints = [ messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                            messageLabel.widthAnchor.constraint(equalToConstant: 250), //size it to only be 250 px wide
        
                            //needs to be after you add subview of lavel
                            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
                            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
                            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
                            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8)]

        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
