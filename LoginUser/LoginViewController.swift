//
//  ViewController.swift
//  LoginUser
//
//  Created by Владислав  on 25.10.2022.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let login = "login"
    let password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTF.delegate = self
        passwordTF.delegate = self
    }
    
    @IBAction func buttonLogInAction(_ sender: Any) {
        passLogin()
        
    }
    private func passLogin() {
        if loginTF.text != login, passwordTF.text != password {
            alertLoginPassword()
            passwordTF.text = ""
        }
    }
    
    @IBAction func logoutButton (for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    private func alertLoginPassword() {
        let alert = UIAlertController(title: "Oopps!", message: "Incorrect login or password", preferredStyle: .alert)
        let nameAlert = UIAlertAction(title: "Okey", style: .default)
        alert.addAction(nameAlert)
        present(alert, animated: true,completion: nil)
    }
    
    
    @IBAction func forgotAlertLogin(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ooops!", message: "Ваш логин похож на ваш логин в логине", preferredStyle: .alert)
        let nameAlert = UIAlertAction(title: "Okey", style: .default)
        alert.addAction(nameAlert)
        
        present(alert, animated: true,completion: nil)
    }
    @IBAction func forgotAlertPass(_ sender: UIButton) {
        let alert = UIAlertController(title: "Внимание!", message: "Ваш пароль похож на пароль в пароле", preferredStyle: .alert)
        let nameAlert = UIAlertAction(title: "Okey", style: .default)
        alert.addAction(nameAlert)
        
        present(alert, animated: true,completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: AuthorizationViewController = segue.destination as! AuthorizationViewController
        destinationVC.titleText = ("Welcome, \(loginTF.text!)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super .touchesBegan(touches, with: event)
    }
}
    
extension ViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == loginTF {
                passwordTF.becomeFirstResponder()
            } else {
                passLogin()
                performSegue(withIdentifier: "Source", sender: buttonLogInAction)
            }
            return true
        }
    }

