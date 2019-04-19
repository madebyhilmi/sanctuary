//
//  ProfileBtnView.swift
//  sanctuary
//
//  Created by Stuart Seguin on 2019-04-19.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class ProfileBtnView: UIView {
    
    weak var chatLogController: ChatViewController? {
        didSet {
           sendButton.addTarget(chatLogController, action: #selector(ChatViewController.checkAction), for: .touchUpInside)
        }
    }
    
    
    let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.isUserInteractionEnabled = true
        profileImageView.image = UIImage(named: "jessica")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    let sendButton = UIButton(type: .system)
    let lbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        //x,y,w,h
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
//        sendButton.setTitle("Jessica", for: .normal)
//        sendButton.setTitleColor(UIColor(red: (0xFF)/255.0, green: (0x11)/255.0, blue: (0x56)/255.0, alpha: 1), for: .normal)
//        sendButton.translatesAutoresizingMaskIntoConstraints = false

        lbl.text = "Jessica"
        lbl.textColor = UIColor(red: (0xFF)/255.0, green: (0x11)/255.0, blue: (0x56)/255.0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(lbl)
        //x,y,w,h
        lbl.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 4).isActive = true
        lbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lbl.widthAnchor.constraint(equalToConstant: 80).isActive = true
        lbl.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}

