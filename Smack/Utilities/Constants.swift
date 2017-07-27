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
    }
    
    //Header
    struct Header {
        static let JSONheader = ["Content-Type" : "application/json; charset=utf-8"]

    }
}
