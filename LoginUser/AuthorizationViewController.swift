//
//  AuthorizationViewController.swift
//  LoginUser
//
//  Created by Владислав  on 28.10.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var labelUser: UILabel!
    
    var titleText: String!
        override func viewDidLoad() {
            super.viewDidLoad()
            labelUser.text = titleText
        }
    
}
