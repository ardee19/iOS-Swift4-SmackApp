//
//  AuthService.swift
//  Smack
//
//  Created by Super Awesome on 7/26/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLogin: Bool {
        get {
            return defaults.bool(forKey: Constants.DefaultKey.loggedIn)
        }
        set {
            defaults.set(newValue, forKey: Constants.DefaultKey.loggedIn)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: Constants.DefaultKey.token) as! String
        }
        set {
            defaults.set(newValue, forKey: Constants.DefaultKey.token)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: Constants.DefaultKey.userEmail) as! String
        }
        set {
            defaults.set(newValue, forKey: Constants.DefaultKey.userEmail)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(Constants.URL.register, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Constants.Header.JSONheader).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(Constants.URL.login, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Constants.Header.JSONheader).responseJSON { (response) in
            
            if response.result.error == nil {
                /*
                // Normal/Traditional Swift Way 
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let email  = json["user"] as? String {
                        self.userEmail = email
                    }
                    if let token = json["token"] as? String {
                        self.authToken = token
                    }
                }
                */
                guard let data = response.data else { return }
                
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLogin = true
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "name" : name,
            "email" : lowerCaseEmail,
            "avatarName" : avatarName,
            "avatarColor" : avatarColor
        ]
        
        Alamofire.request(Constants.URL.addUser, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Constants.Header.bearerHeader).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        Alamofire.request("\(Constants.URL.findUserByEmail)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Header.bearerHeader).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserInfo(data: Data) {
        let json = JSON(data: data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
    }

}
