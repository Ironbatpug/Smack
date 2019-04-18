//
//  Constants.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 09..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Succes: Bool) -> ()

//URL Constants
let BASE_URL = "https://chattytoto11.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"



//color
let SMACKPURPLEPLACEHOLDER = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.5)

//notification Constatns
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")

//segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"


//USER DEFUALTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_MAIL = "userEmail"


//headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
