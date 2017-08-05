//
//  Constants.swift
//  Smack
//
//  Created by Super Awesome on 7/25/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Segues
struct SegueID {
    static let toLogin = "toLogin"
    static let toCreateAccount = "toCreateAccount"
    static let unwindToChannel = "unwindToChannel"
    static let toAvatarPicker = "toAvatarPicker"
}

struct Constants {
    
    //User Defaults
    struct DefaultKey {
        static let token = "token"
        static let loggedIn = "loggedIn"
        static let userEmail = "userEmail"
    }
    
    //URL Constants
    struct URL {
        static let base = "https://chat-smack.herokuapp.com/v1/"
        static let register = "\(base)account/register"
        static let login = "\(base)account/login"
        static let addUser = "\(base)user/add"
        static let findUserByEmail = "\(base)user/byEmail/"
        static let getChannels = "\(base)channel"
    }
    
    //Header
    struct Header {
        static let JSONheader = ["Content-Type" : "application/json; charset=utf-8"]
        static let bearerHeader = [
            "Authorization" : "Bearer \(AuthService.instance.authToken)",
            "Content-Type" : "application/json; charset=utf-8"
        ]
    }
    
    //Color
    struct Color {
        static let smackPurplePlaceHolder = #colorLiteral(red: 0.2392156863, green: 0.3319521546, blue: 0.7513278127, alpha: 0.5)
    }
    
    //Notification
    struct Notif {
        static let userDataDidChange = Notification.Name("notifUserDataDidChange")
        static let channelsLoaded = Notification.Name("channelsLoaded")
        static let channelSelected = Notification.Name("channelSelected")
    }
}
