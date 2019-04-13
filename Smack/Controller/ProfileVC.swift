//
//  ProfileVC.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 13..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE,object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        nameLbl.text = UserDataService.instance.name
        emailLbl.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closetap(_:)))
        
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closetap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
