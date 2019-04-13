//
//  PurpleColorTextfield.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 13..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

@IBDesignable
class PurpleColorTextfield: UITextField {

    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
}
