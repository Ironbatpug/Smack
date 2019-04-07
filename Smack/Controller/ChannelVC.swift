//
//  ChannelVC.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 03..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-60
    }
}
