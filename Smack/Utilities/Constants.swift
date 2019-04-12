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


//segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"


//USER DEFUALTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_MAIL = "userEmail"


//headers
let HEADER = [
    "Content-Type":  "application/json; charset=utf-8"
]
