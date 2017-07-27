//
//  UserDataService.swift
//  Smack
//
//  Created by Super Awesome on 7/26/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import Foundation

class UserDataService{
    
    static let instance = UserDataService()
    
    //*Getter is PUBLIC, while Setter is PRIVATE
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
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
}
