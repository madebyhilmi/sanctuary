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
    
    let textField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Don't be shy..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        return textField
    }()
    var inputViewBottomAnchor : NSLayoutConstraint?
    var insets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)



    var chatMessages = [
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

        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableView.contentInset = insets
        
        tableView.keyboardDismissMode = .interactive
        
        setUpInputComponents()

        setUpKeyboardObservers()
    }
    
    func setUpKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleKeyboardWillHide(notification: NSNotification) {
        inputViewBottomAnchor?.constant = 0
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        insets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableView.contentInset = insets
        
        UIView.animate(withDuration: keyboardDuration!, animations: { self.view.layoutIfNeeded() })

    }
    
    @objc func handleKeyboardWillShow(notification: NSNotification) {
        let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue

        insets = UIEdgeInsets(top: 0, left: 0, bottom: 65, right: 0)
        tableView.contentInset = insets
        
        inputViewBottomAnchor?.constant = -keyboardFrame!.height
        UIView.animate(withDuration: keyboardDuration!, animations: { self.view.layoutIfNeeded() })
    }
    
    func setUpInputComponents() {
        let inputView = UIView()
        inputView.backgroundColor = .white
        inputView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationController?.view.addSubview(inputView)
        
        inputView.leftAnchor.constraint(equalTo: (navigationController?.view.leftAnchor)!).isActive = true
        inputViewBottomAnchor = inputView.bottomAnchor.constraint(equalTo: (navigationController?.view.bottomAnchor)!)
        inputViewBottomAnchor?.isActive = true
        inputView.widthAnchor.constraint(equalTo: (navigationController?.view.widthAnchor)!).isActive = true
        inputView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        inputView.addSubview(textField)
        
        textField.leftAnchor.constraint(equalTo: inputView.leftAnchor, constant: 10).isActive = true
        textField.topAnchor.constraint(equalTo: inputView.topAnchor, constant: 5).isActive = true
        textField.widthAnchor.constraint(equalTo: inputView.widthAnchor, constant: -83).isActive = true
        
        let sendBtn = UIButton(type: .system)
        sendBtn.setTitle("Send", for: .normal)
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        
        inputView.addSubview(sendBtn)
        
        sendBtn.rightAnchor.constraint(equalTo: inputView.rightAnchor).isActive = true
        sendBtn.topAnchor.constraint(equalTo: inputView.topAnchor).isActive = true
        sendBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        sendBtn.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        let seperatorLineView = UIView()
        seperatorLineView.backgroundColor = UIColor(white: 0.90, alpha: 1)
        seperatorLineView.translatesAutoresizingMaskIntoConstraints = false
        inputView.addSubview(seperatorLineView)
        
        seperatorLineView.leftAnchor.constraint(equalTo: inputView.leftAnchor).isActive = true
        seperatorLineView.topAnchor.constraint(equalTo: inputView.topAnchor).isActive = true
        seperatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        seperatorLineView.widthAnchor.constraint(equalTo: inputView.widthAnchor).isActive = true
    }
    
    @objc func sendMessage() {
        print(textField.text!)

        var section = chatMessages.count - 1
        var row = chatMessages[section].count - 1
        
        chatMessages[section].append(ChatMessage(text: textField.text!, isIncoming: false, date: Date()))
        
        //since we added an el get new values
        section = chatMessages.count - 1
        row = chatMessages[section].count - 1
       
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath.init(row: row, section: section)], with: .automatic)
        tableView.endUpdates()
        
        tableView.scrollToRow(at: IndexPath.init(row: row, section: section), at: .bottom, animated: false)

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
