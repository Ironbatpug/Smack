//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 09..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var userNameTXT: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func generateBackgroundPressed(_ sender: Any) {
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func createAvatarPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return}
        guard let password = passwordTxt.text , passwordTxt.text != "" else { return}
        
        AuthService.instance.registerUser(email: email, password: password) { (succes) in
            if succes{
                print("registered user!")
            }
        }
    }
}
