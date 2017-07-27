//
//  AuthService.swift
//  Smack
//
//  Created by Super Awesome on 7/26/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import Foundation
import Alamofire

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
        let header = ["Content-Type" : "application/json; charset=utf-8"]
        let body: [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(Constants.URL.register, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
}
