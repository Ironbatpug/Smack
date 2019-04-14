//
//  AddChannelVC.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 14..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else {return}
        guard let channelDesc = descTxt.text else {return}
        SocketService.instance.addChannel(channelName: channelName, channeldDescription: channelDesc) { (succes) in
            if succes {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name",attributes: [NSAttributedStringKey.foregroundColor: SMACKPURPLEPLACEHOLDER])
        nameTxt.attributedPlaceholder = NSAttributedString(string: "description",attributes: [NSAttributedStringKey.foregroundColor: SMACKPURPLEPLACEHOLDER])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
    
}
