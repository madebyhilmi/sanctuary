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
    
    let messages = [
        "Hey everyone",
        "Some really really long message that should span quite a few lines so that we can see what these bubbles will look like",
        "Some really really long message that should span quite a few lines so that we can see what these bubbles will look like, Some really really long message that should span quite a few lines so that we can see what these bubbles will look like"
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId , for: indexPath) as! ChatMessageCell

        cell.messageLabel.text = messages[indexPath.row]
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
