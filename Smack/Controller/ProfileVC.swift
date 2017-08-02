//
//  ProfileVC.swift
//  Smack
//
//  Created by Super Awesome on 8/1/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let user = UserDataService.instance
        userName.text = user.name
        userEmail.text = user.email
        profileImg.image = UIImage(named: user.avatarName)
        profileImg.backgroundColor = user.returnUIColor(components: user.avatarColor)
        
        let closeTapped = UITapGestureRecognizer(target: self, action: #selector(dismissVC(_:)))
        bgView.addGestureRecognizer(closeTapped)
    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissVC(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: Constants.Notif.userDataDidChange, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
