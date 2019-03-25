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
    
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!

    
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? UIColor(white: 0.95, alpha: 1) : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
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
                            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250), //size it to only be 250 px wide
        
                            //needs to be after you add subview of lavel
                            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
                            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
                            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
                            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8)]
        NSLayoutConstraint.activate(constraints)

        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        trailingConstraint.isActive = true
        
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
