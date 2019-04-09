//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 09..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
