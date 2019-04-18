//
//  ChatVC.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 03..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var channelNameLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTxtBox: UITextField!
    @IBOutlet weak var tipingUserLbl: UILabel!
    
    
    var tiping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        sendBtn.isHidden = true
                
        view.bindToKeyboard()
        let tap = UIGestureRecognizer(target: self, action: #selector(ChatVC.handleTap))
        view.addGestureRecognizer(tap)
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        SocketService.instance.getChatMessage { (succes) in
            if succes {
                self.tableView.reloadData()
                if MessageService.instance.messages.count > 0 {
                    let endIndex = IndexPath(row: MessageService.instance.messages.count-1, section: 0)
                    self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
                }
            }
        }
        
        SocketService.instance.getTipingUsers { (typingUsers) in
            guard let channelId = MessageService.instance.selectedChannel?.channelID else {return}
            var names = ""
            var numberOfTypers = 0
            
            for (typingUser, channel) in typingUsers {
                if  typingUser != UserDataService.instance.name && channel == channelId {
                    if names == "" {
                        names = typingUser
                    } else {
                        names = "\(names), \(typingUser)"
                    }
                    numberOfTypers += 1
                }
            }
            
            if numberOfTypers > 0 && AuthService.instance.isLoggedIn == true {
                var verb = "is"
                if numberOfTypers > 1 {
                    verb = "are"
                }
                self.tipingUserLbl.text = "\(names) \(verb) is typing a message"
            } else {
                self.tipingUserLbl.text = ""
            }
        }
        
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (succes) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn{
            onLoginGetMessage()
        } else {
            channelNameLbl.text = "Please log in"
            tableView.reloadData()
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    func updateWithChannel(){
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
        getMessages()
    }
    
    @IBAction func messageBoxEditing(_ sender: Any) {
        guard let channeldId = MessageService.instance.selectedChannel?.channelID else {return}
        if messageTxtBox.text == "" {
            tiping = false
            sendBtn.isHidden = false
            SocketService.instance.socket.emit("stopType", UserDataService.instance.name, channeldId)
        } else {
            if tiping == false {
                sendBtn.isHidden = false
                SocketService.instance.socket.emit("startType", UserDataService.instance.name, channeldId)
            }
            tiping = true
        }
    }
    
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            guard let channelid = MessageService.instance.selectedChannel?.channelID else {return}
            guard let message = messageTxtBox.text else {return}
            
            SocketService.instance.addMessage(messageBody: message, userID: UserDataService.instance.id, channelId: channelid) { (succes) in
                if succes {
                    self.messageTxtBox.text = ""
                    self.messageTxtBox.resignFirstResponder()
                    SocketService.instance.socket.emit("stopType", UserDataService.instance.name, channelid)
                }
            }
        }
    }
    
    func onLoginGetMessage(){
        MessageService.instance.findAllChannel { (succes) in
            if succes {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                } else {
                    self.channelNameLbl.text = "No channels yet!"
                }
            }
        }
    }
    
    func getMessages() {
        guard let channelID = MessageService.instance.selectedChannel?.channelID else {return}
        MessageService.instance.findAllMessageForChannel(channelid: channelID) { (succes) in
            if succes {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell{
            let message = MessageService.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
}






