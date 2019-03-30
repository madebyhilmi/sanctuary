//
//  ChatViewController.swift
//  sanctuary
//
//  Created by Hilmi Abou-Saleh on 2019-03-06.
//  Copyright © 2019 Project Sanctuary. All rights reserved.
//

import UIKit

class ChatViewController: UITableViewController {

    fileprivate let cellId = "id"

    let chatMessages = [
        [ ChatMessage(text: "HEYEYEYEYEY", isIncoming: true, date: Date()),
          ChatMessage(text: "Hey cow brains, hows it going?", isIncoming: false, date: Date())
        ],
        [ ChatMessage(text: "Hey cow brains, this is a very very long message, lets see how its going to split onto different lines", isIncoming: true, date: Date()),
          ChatMessage(text: "Hey cow brains, hows it going?Hey cow brains, hows it going?Hey cow brains, hows it going?Hey cow brains, hows it going?", isIncoming: false, date: Date()),
          ChatMessage(text: "THis is a very very long message that will do something eventually but we just need more message like these idk why how much longer should it be????/", isIncoming: false, date: Date()),
          ChatMessage(text: "THis is a very very long message that will do something eventually but we just need more message like these idk why how much longer should it be????/", isIncoming: false, date: Date()),
          ChatMessage(text: "THis is a very very long message that will do something eventually but we just need more message like these idk why how much longer should it be????/", isIncoming: true, date: Date())
            
         ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        setUpInputComponents()
    }
    
    func setUpInputComponents() {
        let containerView = UIView()
        containerView.backgroundColor = .darkGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationController?.view.addSubview(containerView)
        
        containerView.leftAnchor.constraint(equalTo: (navigationController?.view.leftAnchor)!).isActive = true
        containerView.bottomAnchor.constraint(equalTo: (navigationController?.view.bottomAnchor)!).isActive = true
        containerView.widthAnchor.constraint(equalTo: (navigationController?.view.widthAnchor)!).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessage = chatMessages[section].first {
            let dateFormatter = DateFormatter()
          //  dateFormatter.dateFormat = "YYYY/MM/dd h:mm:ss a"
            dateFormatter.dateFormat = "YYYY/MM/dd"

            let datestring = dateFormatter.string(from: firstMessage.date)
            
            let label = DateHeaderLabel()
            label.text = datestring
            
            let containerView = UIView()
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        
        return nil
        

    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if let firstMessage = chatMessages[section].first {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "YYYY/MM/dd h:mm:ss a"
//
//            return dateFormatter.string(from: firstMessage.date)
//        }
//
//        return "Couldn't grab date"
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId , for: indexPath) as! ChatMessageCell
        cell.chatMessage = chatMessages[indexPath.section][indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
