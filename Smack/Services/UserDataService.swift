//
//  UserDataService.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 12..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUNwrapped = r else { return defaultColor}
        guard let gUNwrapped = g else { return defaultColor}
        guard let bUNwrapped = b else { return defaultColor}
        guard let aUNwrapped = a else { return defaultColor}
        
        let rfloat = CGFloat(rUNwrapped.doubleValue)
        let gfloat = CGFloat(gUNwrapped.doubleValue)
        let bfloat = CGFloat(bUNwrapped.doubleValue)
        let afloat = CGFloat(aUNwrapped.doubleValue)

        let newColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newColor
    }
}
