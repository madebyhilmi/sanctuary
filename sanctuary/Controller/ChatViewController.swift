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
    
    var inputViewBottomAnchor : NSLayoutConstraint?
    var insets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)



    var chatMessages = [
        [ ChatMessage(text: "Hey", isIncoming: true, date: Date()),
          ChatMessage(text: "Hey cutie, hows it going?", isIncoming: false, date: Date()),
          ChatMessage(text: "I'm good, just chilling. Hbu?", isIncoming: true, date: Date()),
          ChatMessage(text: "Good good, also chillin...", isIncoming: false, date: Date())
        ],
        [
          ChatMessage(text: "Here is the story of my life... I was born in the wilderness and went on to exist for quite a long time without knowledge of other people. My parents were mauled by bears at a young age. I was raised by the animals of the forest - thus my weird quirks. Eventually I wandered into a city and here we are now...", isIncoming: true, date: Date())
         ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = false
 
        let profileBtn = UIButton(type: .system)
        profileBtn.setTitle("Profile", for: .normal)
        let profileImg = UIImage(named: "jessica")
        profileBtn.setImage(profileImg, for: .normal)
        profileBtn.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileBtn)
        
        
        let unmatchBtn = UIButton(type: .system)
        unmatchBtn.setTitle("I'm bored", for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: unmatchBtn)

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .white

        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white

        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableView.contentInset = insets
        
        
        
        
        
        
        tableView.keyboardDismissMode = .interactive
        
    }
    
    //Set up the input area
    lazy var inputContainerView: ChatInputView = {
        let containerView = ChatInputView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        containerView.chatLogController = self

        return containerView
    }()
    
    override var inputAccessoryView: UIView? {
        get {
           
            return inputContainerView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        get {return true}
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func sendMessage() {
       // print(textField.text!)
        if (inputContainerView.inputTextField.text! != "") {
            var section = chatMessages.count - 1
            var row = chatMessages[section].count - 1
            
            chatMessages[section].append(ChatMessage(text: inputContainerView.inputTextField.text!, isIncoming: false, date: Date()))
            
            //since we added an el get new values
            section = chatMessages.count - 1
            row = chatMessages[section].count - 1
            
            inputContainerView.inputTextField.text! = ""
            
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath.init(row: row, section: section)], with: .automatic)
            tableView.endUpdates()
            
            tableView.scrollToRow(at: IndexPath.init(row: row, section: section), at: .bottom, animated: false)
        }
        

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
