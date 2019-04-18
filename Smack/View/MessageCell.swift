//
//  MessageCell.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 17..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message){
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        timeStamp.text = "12:00:00"
    }

}
