//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Super Awesome on 7/25/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let pass = passTxt.text, passTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            if success {
                print("Registered User!")
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("RD: Logged in user! ", AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: SegueID.unwindToChannel, sender: nil)
                            }
                        })
                    }
                })
            } else {
                print("Registration Failed")
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: SegueID.unwindToChannel, sender: nil)
    }
}
