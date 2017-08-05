//
//  AddChannelVC.swift
//  Smack
//
//  Created by Super Awesome on 8/4/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var channelDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func createChannelPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let tapOutside = UITapGestureRecognizer(target: self, action: #selector(outsideViewTap(_:)))
        bgView.addGestureRecognizer(tapOutside)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : Constants.Color.smackPurplePlaceHolder])
        channelDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : Constants.Color.smackPurplePlaceHolder])
    }
    
    @objc func outsideViewTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
