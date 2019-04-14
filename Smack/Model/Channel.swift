//
//  Channel.swift
//  Smack
//
//  Created by Molnár Csaba on 2019. 04. 14..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import Foundation

struct Channel : Decodable{
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var channelID: String!
}
